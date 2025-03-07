# uvgKvazaarHW

Contains the submodules, IP-XACT files, mock RTL files, SystemC driver, Makefile for Verilator, and patch file for Kvazaar submodule
Enables end-to-end HEVC encoding with HW HEVC simulation in the loop.

## Repository Initialization and Setup

Whole workflow has been verified to work with Ubuntu 24.04.1 LTS.

After cloning this main repository, initialize the submodules and recursively fetch and checkout any nested submodules:
```
git submodule update --init --recursive
```

### Libzmq
For the compilation and installation of libzmq, follow the instructions that can be found in the README.md of libzmq's repository.
- Note: if you want to use libzmq with Questa or Modelsim, the default compilers (gcc/g++) need to point to the ones provided with the installation of the chosen simulator.

### Kvazaar
For Kvazaar, first apply the patch to extend Kvazaar's functionality, enabling it to interface with the hardware simulation via libzmq sockets.
```
git -C kvazaar apply ../systemc/support_for_kvazaar_hw_simulation.patch
```
Then, follow the compilation and installation instructions that can be found in the README.md of kvazaar's repository.

### SystemC
Follow the download/installation instructions from [SystemC Official Website](https://systemc.org/)
- Note: The SystemC driver and when using Verilator, has been verified to work with SystemC 3.0.0, most likely the newest up-to-date version will also work.

### Verilator
Follow the download/installation instructions from [Veripool - Verilator](https://www.veripool.org/verilator/)
- Note: Verilator 5.020 2024-01-01 rev has been verified to work, most likely the newest up-to-date version will also work.

### Kactus2
Kactus2 is the recommended tool for viewing the IP-XACT components and hardware designs in the repository.
Follow the instructions that can be found in the README.md of the [Kactus2 repository](https://github.com/kactus2/kactus2dev) for compilation and installation.

### Siemens - Catapult HLS tool
[Catapult](https://eda.sw.siemens.com/en-US/ic/catapult-high-level-synthesis/) is needed for generating the RTL level code from the high-level synthesis codes in **uvgKvazaarHW_rtl_gen** repository.
Follow the instructions that can be found in the README.md of the **uvgKvazaarHW_rtl_gen** repository for generating the RTLs.
- Note: Catapult version 2024.1 has been verified to work, most likely the newest up-to-date version will also work.


## Getting started

### Generating RTLs from HLS codes
[Catapult](https://eda.sw.siemens.com/en-US/ic/catapult-high-level-synthesis/) is needed for generating the RTL level code from the high-level synthesis codes in **uvgKvazaarHW_rtl_gen** repository.
Follow the instructions that can be found in the README.md of the **uvgKvazaarHW_rtl_gen** repository for generating the RTLs.
- Note: RTLs from the uvgKvazaarHW_rtl_gen need to be generated to `rtl/*` at the root of uvgKvazaarHW repository

As of now, these files cannot be provided pre-compiled, and requires the user to have a license for using Catapult HLS-tool. 
- Note: Kactus2 will show a warning for missing verilog files due to this. 

### Configuring Kactus2
For configuring the library in Kactus2, open the "Configure Library" from the tool bar and then add the root of this repository as a library path.

For opening the top-level hardware design:
  1. locate the `tuni.fi:subsystem:Kvazaar:1.0` component,
  2. right-click the component and select **"Open HW Design"**,
  3. finally, choose either the **"Hierarchical"** or **"Sim"** view.

### Generating the hierarchical RTLs from Kactus2
After opening the top-level hardware design in Kactus2, the RTL for the top-level design and recursively for all hierarchical designs introduced in the top-level can be generated by selecting **"Generation"** from the tool bar and then selecting **"Verilog Generator"**.
- Note: Select the **"Sim"** hardware design view, when generating RTL for simulation purposes.
- Note: `tuni.fi/subsystem/Kvazaar/1.0/rtl` and `tuni.fi/subsystem/Kvazaar/1.0/sim` already include the up-to-date generated RTLs for both **"Hierarchical"** and **"Sim"** view.

### Verilator & Questa/Modelsim
Either Verilator or Questa/Modelsim can be used for simulating all the generated RTLs.

Verilator:
  1. Locate the Makefile in systemc folder.
  2. Run `make`to verilate all RTLs to SystemC using Verilator into the **"Kvazaar_Intra_Encoder_HW"** folder, and then to compile the generated SystemC codes using the Verilator generated Makefile.
  3. Alternatively, first run `make verilate` for verilation and then `make simulation`to compile the generated SystemC codes.

Questa:
  1. In Kactus2, select **"Generation"** from the tool bar, and then selecet **"Modelsim Generation"** to generate a **"Kvazaar.do"** file that will add all necessary files to an existing simulation project.
  2. By default, the **"Kvazaar.do"** file should be saved to `tuni.fi/subsystem/Kvazaar/1.0/`, in that same folder is a file **"Kvazaar_simulation.do"**, that will create the simulation project, add all files according to the Kactus2 generated .do file, configure the use of libzmq for the simulation, and start the compilation of all codes.

### Kvazaar
For Kvazaar to match the features of the HW HEVC intra encoder as closely as possible, the ultrafast preset can be used in all-intra mode.

Individual parameters corresponding the HW HEVC intra encoder as close as possible are the following:
`-p 1 -n 1 --pu-depth-intra 1-4 --full-intra-search --no-rdoq --no-transform-skip --rd 0 --no-sao --no-deblock --no-signhide`

Parameters affecting the HW HEVC encoding are `--qp <int>` for quantization parameter, and `--pu-depth-intra <int>-<int>` for the intra search range. 

N number of threads are supported, but a sinlge HW HEVC intra encoder can only serve 16 CTUs in parallel. If using N > 16 threads, threads will served after previous ones have been served.

### Simulation
The simulation flow is the following:
  1. First start Kvazaar with the appropriate parameters,
  2. then start the HW simulation using either Questa/Modelsim or Verilator generated SystemC simulation,
  3. then wait for the simulation and HEVC encoding to finish (which will take some time depending on the resolution of the test sequence),
  4. finally, view and verify that the encoded HEVC bitstream is valid with a program that can decode HEVC.