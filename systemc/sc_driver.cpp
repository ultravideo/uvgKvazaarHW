/*****************************************************************************
 * This file is part of uvgKvazaarHW.
 *
 * Copyright (c) 2025, Tampere University, ITU/ISO/IEC, project contributors
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * * Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * 
 * * Neither the name of the Tampere University or ITU/ISO/IEC nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * INCLUDING NEGLIGENCE OR OTHERWISE ARISING IN ANY WAY OUT OF THE USE OF THIS
 ****************************************************************************/
 
#include "systemc.h"
#include <string>
#include <pthread.h>

// Makefile defines VERILATOR when compiling with Verilator
//#define VERILATOR

// Choose the correct header for simulation, Questa as default
#ifndef VERILATOR
#include "sc_Kvazaar.h"
#else
#include "Kvazaar_Intra_Encoder_HW/VKvazaar.h"
#endif
#include <zmq.h>

#define MAX(a, b) (((a) > (b)) ? (a) : (b))
#define MIN(a, b) (((a) < (b)) ? (a) : (b))

#define ENCODING_DATA_SIZE  6992
#define ENCODED_DATA_SIZE   9504

#define CTU_IDS_PER_INTRA_CORE 16

static const std::string loopback_tcp = "tcp://127.0.0.1:";

// Conversion functions for the different interfaces used by Verilator generated header and Questa generated header
template<int WIDTH, typename T>
inline auto convert_vector(const T& val) {
    #ifndef VERILATOR
        return sc_lv<WIDTH>(val);
    #else
        return val;
    #endif
}

template<typename T>
inline auto convert_bit(const T& val) {
    #ifndef VERILATOR
        return sc_logic(val);
    #else
        return val;
    #endif
}

SC_MODULE(Driver)
{
    sc_out<bool> rst_n;
    sc_in<bool> clk_mem;

// Ports based on if using Questa or Verilator
#ifndef VERILATOR
    sc_out<sc_lv<32> > cabac_btm_config_dat;
    sc_out<sc_logic> cabac_btm_config_vld;
    sc_in<sc_logic> cabac_btm_config_rdy;
    
    sc_out<sc_lv<32> > cabac_top_config_dat;
    sc_out<sc_logic> cabac_top_config_vld;
    sc_in<sc_logic> cabac_top_config_rdy;

    sc_out<sc_lv<4> > intra_data_req_rsc_dat;
    sc_out<sc_logic> intra_data_req_rsc_vld;
    sc_in<sc_logic> intra_data_req_rsc_rdy;
    
    sc_out<sc_lv<156> > intra_data_to_hw_rsc_dat;
    sc_out<sc_logic> intra_data_to_hw_rsc_vld;
    sc_in<sc_logic> intra_data_to_hw_rsc_rdy;

    sc_in<sc_lv<128> > intra_data_from_hw_rsc_dat;
    sc_in<sc_logic> intra_data_from_hw_rsc_vld;
    sc_out<sc_logic> intra_data_from_hw_rsc_rdy;

    sc_out<sc_lv<32> > intra_config_to_hw_dat;
    sc_out<sc_logic> intra_config_to_hw_vld;
    sc_in<sc_logic> intra_config_to_hw_rdy;

    sc_in<sc_logic> ctu_btm_flush;
    sc_in<sc_lv<8> > ctu_btm_id;
    sc_in<sc_logic> ctu_top_flush;
    sc_in<sc_lv<8> > ctu_top_id;
    
    sc_in<sc_lv<16> > ctu_done_extended_1;
    sc_in<sc_lv<16> > ctu_done_extended;
#else
    sc_out<uint32_t> cabac_btm_config_dat;
    sc_out<bool> cabac_btm_config_vld;
    sc_in<bool> cabac_btm_config_rdy;
    
    sc_out<uint32_t> cabac_top_config_dat;
    sc_out<bool> cabac_top_config_vld;
    sc_in<bool> cabac_top_config_rdy;

    sc_out<uint32_t> intra_data_req_rsc_dat;
    sc_out<bool> intra_data_req_rsc_vld;
    sc_in<bool> intra_data_req_rsc_rdy;
    
    sc_out<sc_dt::sc_bv<156> > intra_data_to_hw_rsc_dat;
    sc_out<bool> intra_data_to_hw_rsc_vld;
    sc_in<bool> intra_data_to_hw_rsc_rdy;

    sc_in<sc_dt::sc_bv<128> > intra_data_from_hw_rsc_dat;
    sc_in<bool> intra_data_from_hw_rsc_vld;
    sc_out<bool> intra_data_from_hw_rsc_rdy;

    sc_out<uint32_t> intra_config_to_hw_dat;
    sc_out<bool> intra_config_to_hw_vld;
    sc_in<bool> intra_config_to_hw_rdy;

    sc_in<bool> ctu_btm_flush;
    sc_in<uint32_t> ctu_btm_id;
    sc_in<bool> ctu_top_flush;
    sc_in<uint32_t> ctu_top_id;
    
    sc_in<uint32_t> ctu_done_extended_1;
    sc_in<uint32_t> ctu_done_extended;
#endif

    void send_data_and_configure_intra_search_core();
    void configure_cabac_core();
    void read_data_from_hw();

    void socket_receiving();
    void socket_sending();

    char* buffer_recv[CTU_IDS_PER_INTRA_CORE];
    char* buffer_send[CTU_IDS_PER_INTRA_CORE];
    int data_pending[CTU_IDS_PER_INTRA_CORE];
    int data_available_for_reading[CTU_IDS_PER_INTRA_CORE];
    int data_available_for_sending[CTU_IDS_PER_INTRA_CORE];
    
    void *context[CTU_IDS_PER_INTRA_CORE];
    void *replier[CTU_IDS_PER_INTRA_CORE];

    SC_CTOR(Driver)
    {
        // Allocate buffers for all IDs
        for(int ctu_id = 0; ctu_id < CTU_IDS_PER_INTRA_CORE; ctu_id++)
        {
            data_pending[ctu_id] = 0;
            data_available_for_reading[ctu_id] = 0;
            data_available_for_sending[ctu_id] = 0;

            buffer_recv[ctu_id] = (char*)malloc((4*1 + 4*1 + 4*6 + ENCODING_DATA_SIZE) * sizeof(char));
            buffer_send[ctu_id] = (char*)malloc(ENCODED_DATA_SIZE * sizeof(char));

        }

		SC_CTHREAD(send_data_and_configure_intra_search_core, clk_mem.pos());
        set_stack_size(0xFFFFFFF);

        SC_CTHREAD(configure_cabac_core, clk_mem.pos());
        set_stack_size(0xFFFFFFF);

        SC_CTHREAD(read_data_from_hw, clk_mem.pos());
        set_stack_size(0xFFFFFFF);

        SC_CTHREAD(socket_receiving, clk_mem.pos());
        set_stack_size(0xFFFFFFF);
        SC_CTHREAD(socket_sending, clk_mem.pos());
        set_stack_size(0xFFFFFFF);
    }

};

void Driver::socket_receiving()
{
    

    for(int ctu_id = 0; ctu_id < CTU_IDS_PER_INTRA_CORE; ctu_id++)
    {
        context[ctu_id] = zmq_ctx_new();
        replier[ctu_id] = zmq_socket(context[ctu_id], ZMQ_REP);

        std::string address = loopback_tcp + std::to_string(5560+ctu_id);
        zmq_connect(replier[ctu_id], address.c_str());
    }
    wait();
    while(1)
    {
        // Questa might interrupt zmq_recv from time to time -> use a while loop and check the receiving the data is successful
        int ctu_id = 0;
        while(1)
        {
            for(int ctu_id = 0; ctu_id < CTU_IDS_PER_INTRA_CORE; ctu_id++)
            {
                if(data_pending[ctu_id] == 1)
                {
                    continue;
                }
                //cout << "waiting CTU ID data " << ctu_id << endl;
                // Read data using ZMQ with ZMQ_DONTWAIT so that waiting for data does not block simulation time from proceeding
                int bytes = zmq_recv(replier[ctu_id], buffer_recv[ctu_id], (4*1 + 4*1 + 4*6 + ENCODING_DATA_SIZE) * sizeof(char), ZMQ_DONTWAIT);
                if (bytes == -1) 
                {
                    //cout << "Error: " << zmq_strerror(zmq_errno()) << endl;
                    continue;
                    
                }
                else
                {
                    cout << "Processing CTU ID " << ctu_id << endl;
                    data_available_for_reading[ctu_id] = 1;
                    data_pending[ctu_id] = 1;
                }
                wait();
            }
            // Using wait() here is optional, but questa is a bit more responsive with it -> cout and break/stop works
            wait();
        }
    }
}

void Driver::socket_sending()
{
    while(1)
    {
        int ctu_id_send_data = -1;

        while(1)
        {
            for(int ctu_id = 0; ctu_id < CTU_IDS_PER_INTRA_CORE; ctu_id++)
            {
                if(data_available_for_sending[ctu_id] == 1)
                {
                    ctu_id_send_data = ctu_id;
                    break;
                }
            }
            wait();
            if(ctu_id_send_data != -1)
            {
                break;
            }
        }

        cout << "CTU ID " << ctu_id_send_data  << " done!" << endl;
        zmq_send(replier[ctu_id_send_data], buffer_send[ctu_id_send_data], ENCODED_DATA_SIZE, 0);
        data_available_for_sending[ctu_id_send_data] = 0;
        data_pending[ctu_id_send_data] = 0;
        wait();
    }
}

void Driver::send_data_and_configure_intra_search_core()
{
    // Initialize ports and generate a reset sequence
    rst_n.write(0);
    wait();

    #ifndef VERILATOR
    intra_data_to_hw_rsc_dat.write(sc_lv<156>(0));
    intra_data_to_hw_rsc_vld.write(sc_logic(0));
    
    intra_config_to_hw_dat.write(sc_lv<32>(0));
    intra_config_to_hw_vld.write(sc_logic(0));

#else
    intra_data_to_hw_rsc_dat.write(0);
    intra_data_to_hw_rsc_vld.write(0);
    
    intra_config_to_hw_dat.write(0);
    intra_config_to_hw_vld.write(0);
#endif
    wait();
    rst_n.write(1);
    wait();

    while(1)
    {
        int ctu_id = 0, counter = 0;
        while(1)
        {
            int do_break = 0;
            for(int a = 0; a < CTU_IDS_PER_INTRA_CORE; a++)
            {
                if(data_available_for_reading[a])
                {
                    ctu_id = a;
                    do_break = 1;
                    break;
                }                
            }            
            if(do_break)
            {
                break;
            }            
            wait();
        }
        
        // Set the configuration data from the received data
        sc_uint<32> intra_conf = ((unsigned int*)&buffer_recv[ctu_id][ENCODING_DATA_SIZE])[0];
        sc_uint<32> quant_conf = ((unsigned int*)&buffer_recv[ctu_id][ENCODING_DATA_SIZE])[1];       

        // Send data to HW, using 128bit 16byte transfers
        sc_uint<24> addr = 0;
        //sc_uint<4> ctu_id = intra_conf.range(3,0);

        //cout << "intra conf id " << intra_conf.range(3,0).to_uint() << endl;

        for(int a = 0; a < ENCODING_DATA_SIZE/16; a++)
        {
            sc_biguint<156> data_to_hw = 0;
            // Set data
            for(int b = 0; b < 16; b++)
            {
                data_to_hw.range(8 + 8*b - 1, 8*b) = buffer_recv[ctu_id][b + 16*a];
            }
            // Set addr using byte addressing
            data_to_hw.range(128+24-1,128) = addr;
            data_to_hw.range(152+4-1,152) = (sc_uint<4>)ctu_id;
            addr += 16;

            intra_data_to_hw_rsc_dat.write(convert_vector<156>(data_to_hw));
            intra_data_to_hw_rsc_vld.write(convert_bit(1));
            do
            {
                wait();
            }
            while(intra_data_to_hw_rsc_rdy.read() != convert_bit(1));
        }
        intra_data_to_hw_rsc_vld.write(convert_bit(0));                  

        // Send two 32bit configurations to the IntraSearchCore
        while(1)
        {
            if(counter == 0)
            {
                intra_config_to_hw_dat.write(convert_vector<32>(intra_conf));
                //cout << intra_conf.to_uint() << endl;
            }
            else if(counter == 1)
            {
                intra_config_to_hw_dat.write(convert_vector<32>(quant_conf));
                //cout << quant_conf.to_uint() << endl;
            }
            if(intra_config_to_hw_rdy.read() == 1)
            {
                intra_config_to_hw_vld.write(convert_bit(1));
                wait();
                intra_config_to_hw_vld.write(convert_bit(0));
                wait();
                counter++;
                if(counter == 2)
                {
                    break;
                }
            }
            wait();
        }
        data_available_for_reading[ctu_id] = 0;
    }
}

void Driver::configure_cabac_core()
{
    // Initialize ports
    #ifndef VERILATOR
    cabac_btm_config_dat.write(sc_lv<32>(0));
    cabac_btm_config_vld.write(sc_logic(0));

    cabac_top_config_dat.write(sc_lv<32>(0));
    cabac_top_config_vld.write(sc_logic(0));

#else
    cabac_btm_config_dat.write(0);
    cabac_btm_config_vld.write(0);

    cabac_top_config_dat.write(0);
    cabac_top_config_vld.write(0);
#endif

    while(1)
    {
        int ctu_id;
        bool ctu_btm_flag = 0;
        bool ctu_top_flag = 0;
        while(1)
        {       
            ctu_btm_flag = ctu_btm_flush.read()  == convert_bit(1);
            if(ctu_btm_flag)
            {
#ifdef VERILATOR            	
                ctu_id = ctu_btm_id.read();
#else               
                ctu_id = ctu_btm_id.read().to_uint();
#endif          
                break;
            }

            ctu_top_flag = ctu_top_flush.read() == convert_bit(1);
            if(ctu_top_flag)
            {
#ifdef VERILATOR            	
                ctu_id = ctu_top_id.read();
#else               
                ctu_id = ctu_top_id.read().to_uint();
#endif
                break;
            }
            wait();
        }

        //cout << ctu_btm_flag << " " <<  ctu_top_flag << " " << ctu_id << endl;

        sc_uint<32> cabac_conf[6];
        for(int a = 0; a < 6; a++)
        {
            cabac_conf[a] = ((unsigned int*)&buffer_recv[ctu_id+8*ctu_top_flag][ENCODING_DATA_SIZE])[2+a];
        }

        // Write the 6 32bit configuration to the CABAC core
        int counter = 0;
        if(ctu_btm_flag)
        {
            while(1)
            {
                cabac_btm_config_dat.write(convert_vector<32>(cabac_conf[counter]));
                
                if(cabac_btm_config_rdy.read() == (1))
                {
                    cabac_btm_config_vld.write(convert_bit(1));
                    wait();
                    cabac_btm_config_vld.write(convert_bit(0));
                    wait();
                    counter++;
                    if(counter == 6)
                    {
                        break;
                    }
                }
                wait();
            }
        }
        else
        {
            while(1)
            {
                cabac_top_config_dat.write(convert_vector<32>(cabac_conf[counter]));
                
                if(cabac_top_config_rdy.read() == (1))
                {
                    cabac_top_config_vld.write(convert_bit(1));
                    wait();
                    cabac_top_config_vld.write(convert_bit(0));
                    wait();
                    counter++;
                    if(counter == 6)
                    {
                        break;
                    }
                }
                wait();
            }
        }
    }
}

void Driver::read_data_from_hw()
{
    // Initialize ports
    #ifndef VERILATOR
    intra_data_req_rsc_dat.write(sc_lv<32>(0));
    intra_data_req_rsc_vld.write(sc_logic(0));

    intra_data_from_hw_rsc_rdy.write(sc_logic(0));

#else
    intra_data_req_rsc_dat.write(0);
    intra_data_req_rsc_vld.write(0);

    intra_data_from_hw_rsc_rdy.write(0);
#endif

    while(1)
    {
        // Start waiting for the CABAC core to finish
        //TODO: Add support for CABAC top core
        int ctu_id = 0;
        while(1)
        {
            sc_lv<16> ctu_done_1 = ctu_done_extended_1.read();
            sc_lv<16> ctu_done = ctu_done_extended.read();
            if(ctu_done_1.is_01())
            {                
                sc_uint<16> temp = (sc_uint<16>)ctu_done_1;
                if(temp != 0)
                {
                    for(int a = 0; a < CTU_IDS_PER_INTRA_CORE; a++)
                    {
                        if(temp == ((sc_uint<16>)1)<<a)
                        {
                            ctu_id = a;
                            break;
                        }
                    }
                    break;
                }
            }

            if(ctu_done.is_01())
            {                
                sc_uint<16> temp = (sc_uint<16>)ctu_done;
                if(temp != 0)
                {
                    for(int a = 0; a < CTU_IDS_PER_INTRA_CORE; a++)
                    {
                        if(temp == ((sc_uint<16>)1)<<a)
                        {
                            ctu_id = a+8;
                            break;
                        }
                    }
                    break;
                }
            }
            
            wait();
        }
        
        // Send a request to the indexer to start outputing data for the requested CTU ID
        intra_data_req_rsc_dat.write(convert_vector<4>((sc_uint<4>)ctu_id));
        intra_data_req_rsc_vld.write(convert_bit(1));
        do
        {
            wait();
        } 
        while (intra_data_req_rsc_rdy.read() != convert_bit(1));
        intra_data_req_rsc_vld.write(convert_bit(0));
        wait();
    
        // Read the data coming from HW and store them to the buffer
        for(int a = 0; a < ENCODED_DATA_SIZE/16; a++)
        {           
            sc_biguint<128> data_from_hw = 0;

            do
            {
                intra_data_from_hw_rsc_rdy.write(convert_bit(1));
                wait();
            }
            while(intra_data_from_hw_rsc_vld.read() != convert_bit(1));

            data_from_hw = (sc_biguint<128>)intra_data_from_hw_rsc_dat.read();
            
            // set data
            for(int b = 0; b < 16; b++)
            {
                buffer_send[ctu_id][b + 16*a] = (char)data_from_hw.range(8 + 8*b - 1, 8*b).to_uint();
            }
        }

        intra_data_from_hw_rsc_rdy.write(convert_bit(0));

        data_available_for_sending[ctu_id] = 1;

        wait();
    }
}

int sc_main(int argc, char** argv)
{
    #ifndef VERILATOR
    Kvazaar* Kvazaar_inst = new Kvazaar("Kvazaar", "Kvazaar");
    #else
    VKvazaar* Kvazaar_inst = new VKvazaar("Kvazaar");
    #endif

    Driver* TB_inst = new Driver(("Driver"));

    sc_signal<bool> rst_n;

    /*sc_clock clk_bin_coding("clk_bin_coding", 3.759398496, SC_NS);
    sc_clock clk_binarization("clk_binarization", 3.759398496, SC_NS);
    sc_clock clk_cabac_base("clk_cabac_base", 5.263157895, SC_NS);
    sc_clock clk_mem("clk_mem", 4, SC_NS);
    sc_clock clk_intra_base("clk_intra_base", 5.263157895, SC_NS);
    sc_clock clk_intra_pred("clk_intra_pred", 4.511278189, SC_NS);*/
    
    sc_clock single_clock("single_clock", 4, SC_NS);
 
    #ifndef VERILATOR
    sc_signal<sc_logic> cabac_btm_config_in_vld_s;
    sc_signal<sc_logic> cabac_btm_config_in_rdy_s;
    sc_signal<sc_logic> cabac_top_config_in_vld_s;
    sc_signal<sc_logic> cabac_top_config_in_rdy_s;
    sc_signal<sc_logic> ctu_btm_flush_s;
    sc_signal<sc_lv<8> > ctu_btm_id_s;
    sc_signal<sc_logic> ctu_top_flush_s;
    sc_signal<sc_lv<8> > ctu_top_id_s;
    sc_signal<sc_logic> intra_config_in_vld_s;
    sc_signal<sc_logic> intra_config_in_rdy_s;
    sc_signal<sc_logic> intra_data_in_rsc_vld_s;
    sc_signal<sc_logic> intra_data_in_rsc_rdy_s;
    sc_signal<sc_logic> intra_data_out_rsc_rdy_s;
    sc_signal<sc_logic> intra_data_out_rsc_vld_s;
    sc_signal<sc_lv<4> > intra_data_req_rsc_dat_s;
    sc_signal<sc_logic> intra_data_req_rsc_vld_s;
    sc_signal<sc_logic> intra_data_req_rsc_rdy_s;
    sc_signal<sc_lv<16> > ctu_done_extended_1_s;
    sc_signal<sc_lv<16> > ctu_done_extended_s;
    sc_signal<sc_lv<32> > cabac_btm_config_in_dat_s;
    sc_signal<sc_lv<32> > cabac_top_config_in_dat_s;
    sc_signal<sc_lv<32> > intra_config_in_dat_s;
    sc_signal<sc_lv<156> > intra_data_in_rsc_dat_s;
    sc_signal<sc_lv<128> > intra_data_out_rsc_dat_s;
    #else
    sc_signal<bool> cabac_btm_config_in_vld_s;
    sc_signal<bool> cabac_btm_config_in_rdy_s;
    sc_signal<bool> cabac_top_config_in_vld_s;
    sc_signal<bool> cabac_top_config_in_rdy_s;
    sc_signal<bool> ctu_btm_flush_s;
    sc_signal<uint32_t> ctu_btm_id_s;
    sc_signal<bool> ctu_top_flush_s;
    sc_signal<uint32_t> ctu_top_id_s;
    sc_signal<bool> intra_config_in_vld_s;
    sc_signal<bool> intra_config_in_rdy_s;
    sc_signal<bool> intra_data_in_rsc_vld_s;
    sc_signal<bool> intra_data_in_rsc_rdy_s;
    sc_signal<bool> intra_data_out_rsc_rdy_s;
    sc_signal<bool> intra_data_out_rsc_vld_s;
    sc_signal<uint32_t> intra_data_req_rsc_dat_s;
    sc_signal<bool> intra_data_req_rsc_vld_s;
    sc_signal<bool> intra_data_req_rsc_rdy_s;
    sc_signal<uint32_t> ctu_done_extended_1_s;
    sc_signal<uint32_t> ctu_done_extended_s;
    sc_signal<uint32_t> cabac_btm_config_in_dat_s;
    sc_signal<uint32_t> cabac_top_config_in_dat_s;
    sc_signal<uint32_t> intra_config_in_dat_s;
    sc_signal<sc_dt::sc_bv<156> > intra_data_in_rsc_dat_s;
    sc_signal<sc_dt::sc_bv<128> > intra_data_out_rsc_dat_s;
    #endif

    Kvazaar_inst->rst_n(rst_n);

    /*Kvazaar_inst->clk_bin_coding(clk_bin_coding);
    Kvazaar_inst->clk_binarization(clk_binarization);
    Kvazaar_inst->clk_cabac_base(clk_cabac_base);
    Kvazaar_inst->clk_mem(clk_mem);
    Kvazaar_inst->clk_intra_base(clk_intra_base);
    Kvazaar_inst->clk_intra_pred(clk_intra_pred);*/

    Kvazaar_inst->clk_bin_coding(single_clock);
    Kvazaar_inst->clk_binarization(single_clock);
    Kvazaar_inst->clk_cabac_base(single_clock);
    Kvazaar_inst->clk_mem(single_clock);
    Kvazaar_inst->clk_intra_base(single_clock);
    Kvazaar_inst->clk_intra_pred(single_clock);

    Kvazaar_inst->cabac_btm_config_in_dat(cabac_btm_config_in_dat_s);
    Kvazaar_inst->cabac_btm_config_in_vld(cabac_btm_config_in_vld_s);
    Kvazaar_inst->cabac_btm_config_in_rdy(cabac_btm_config_in_rdy_s);

    Kvazaar_inst->cabac_top_config_in_dat(cabac_top_config_in_dat_s);
    Kvazaar_inst->cabac_top_config_in_vld(cabac_top_config_in_vld_s);
    Kvazaar_inst->cabac_top_config_in_rdy(cabac_top_config_in_rdy_s);

    Kvazaar_inst->intra_data_req_rsc_dat(intra_data_req_rsc_dat_s);
    Kvazaar_inst->intra_data_req_rsc_vld(intra_data_req_rsc_vld_s);
    Kvazaar_inst->intra_data_req_rsc_rdy(intra_data_req_rsc_rdy_s);

    Kvazaar_inst->intra_data_in_rsc_dat(intra_data_in_rsc_dat_s);
    Kvazaar_inst->intra_data_in_rsc_vld(intra_data_in_rsc_vld_s);
    Kvazaar_inst->intra_data_in_rsc_rdy(intra_data_in_rsc_rdy_s);

    Kvazaar_inst->intra_data_out_rsc_dat(intra_data_out_rsc_dat_s);
    Kvazaar_inst->intra_data_out_rsc_vld(intra_data_out_rsc_vld_s);
    Kvazaar_inst->intra_data_out_rsc_rdy(intra_data_out_rsc_rdy_s);
    
    Kvazaar_inst->intra_config_in_dat(intra_config_in_dat_s);
    Kvazaar_inst->intra_config_in_vld(intra_config_in_vld_s);
    Kvazaar_inst->intra_config_in_rdy(intra_config_in_rdy_s);
    
    Kvazaar_inst->ctu_btm_flush(ctu_btm_flush_s);
    Kvazaar_inst->ctu_btm_id(ctu_btm_id_s);
    Kvazaar_inst->ctu_top_flush(ctu_top_flush_s);
    Kvazaar_inst->ctu_top_id(ctu_top_id_s);
    Kvazaar_inst->ctu_done_extended_1(ctu_done_extended_1_s);
    Kvazaar_inst->ctu_done_extended(ctu_done_extended_s);
    
    //TB_inst->clk_mem(clk_mem);
    TB_inst->clk_mem(single_clock);
    TB_inst->rst_n(rst_n);

    TB_inst->cabac_btm_config_dat(cabac_btm_config_in_dat_s);
    TB_inst->cabac_btm_config_vld(cabac_btm_config_in_vld_s);
    TB_inst->cabac_btm_config_rdy(cabac_btm_config_in_rdy_s);
    
    TB_inst->cabac_top_config_dat(cabac_top_config_in_dat_s);
    TB_inst->cabac_top_config_vld(cabac_top_config_in_vld_s);
    TB_inst->cabac_top_config_rdy(cabac_top_config_in_rdy_s);

    TB_inst->intra_data_req_rsc_dat(intra_data_req_rsc_dat_s);
    TB_inst->intra_data_req_rsc_vld(intra_data_req_rsc_vld_s);
    TB_inst->intra_data_req_rsc_rdy(intra_data_req_rsc_rdy_s);
    
    TB_inst->intra_data_to_hw_rsc_dat(intra_data_in_rsc_dat_s);
    TB_inst->intra_data_to_hw_rsc_vld(intra_data_in_rsc_vld_s);
    TB_inst->intra_data_to_hw_rsc_rdy(intra_data_in_rsc_rdy_s);

    TB_inst->intra_data_from_hw_rsc_dat(intra_data_out_rsc_dat_s);
    TB_inst->intra_data_from_hw_rsc_vld(intra_data_out_rsc_vld_s);
    TB_inst->intra_data_from_hw_rsc_rdy(intra_data_out_rsc_rdy_s);

    TB_inst->intra_config_to_hw_dat(intra_config_in_dat_s);
    TB_inst->intra_config_to_hw_vld(intra_config_in_vld_s);
    TB_inst->intra_config_to_hw_rdy(intra_config_in_rdy_s);

    TB_inst->ctu_btm_flush(ctu_btm_flush_s);
    TB_inst->ctu_btm_id(ctu_btm_id_s);
    TB_inst->ctu_top_flush(ctu_top_flush_s);
    TB_inst->ctu_top_id(ctu_top_id_s);
    TB_inst->ctu_done_extended_1(ctu_done_extended_1_s);
    TB_inst->ctu_done_extended(ctu_done_extended_s);

    sc_start();
    return 0;
}