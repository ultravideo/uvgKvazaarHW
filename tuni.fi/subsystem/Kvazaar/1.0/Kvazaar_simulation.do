# Create a new project named Kvazaar_sim
project new "." Kvazaar_sim

project close

exec sed -i "/^; CppOptions/c\\CppOptions=-I../../../../libzmq/include" Kvazaar_sim.mpf

project open Kvazaar_sim

# Add SystemC source files and other source files to the project
do Kvazaar.do

sccom -link -work work -lzmq
