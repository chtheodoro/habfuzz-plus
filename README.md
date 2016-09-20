# HABFUZZ

HABFUZZ is a FORTRAN 95 code, which implements the Mamdani - Assilian fuzzy inference process (Mamdani and Assilian, 1975). It is specifically structured to quickly calculate the fuzzy-logic-based instream habitat suitability along a hydraulically simulated river reach. However, if appropriately modified, it can be applied to wider research topics requiring fuzzy logic to be addressed.

### 1. Overview of the fuzzy inference process

As initially proposed by Zadeh (1965) and described in detail by Ross (2010), the process of deriving the fuzzy-based habitat suitability, given the flow velocity, water depth and substrate type, can be summarized in four steps (Fig. 1):

a. Fuzzification of the input variables
  
In this step, the user defines categories (membership functions) for each input variable and the input values of flow velocity, water depth and substrate type are assigned to one or more membership functions. By this procedure, crisp numerical values of each input variable are converted to a fuzzy ‘degree of membership’, ranging from 0 to 1 for each membership function. For example, a depth value of 14 cm may derive a membership degree of 0.7 for the ‘shallow’ membership function and 0.28 for the ‘very shallow’ membership function.

b. Application of a fuzzy operator (AND or OR) in the antecedent (IF-THEN rules)
  
According to the reference data for the target aquatic community, the AND (min) or OR (max) operator is applied to each combination of variables (membership functions since step 1) and the derived value is assigned to the membership function of the output variable (defined in step 1), in this case the habitat suitability. For example, if the user defines five membership functions for habitat suitability (bad, poor, moderate, good, high), then the application of the fuzzy operator would result in,

![1](https://cloud.githubusercontent.com/assets/21544603/18666875/c7f1fcce-7f36-11e6-8da5-9a8c657c6eea.png)

where,
fi denotes for the membership function of each input and output variable  
V is the flow velocity  
D is the water depth  
hs is the habitat suitability  
etc., until all possible combinations of fuzzy inputs are assigned to an output membership function, based on the rationale that, for example,  
IF flow velocity is f3 (moderate) AND water depth is f2 (shallow) THEN habitat suitability is f4 (good).

c. Aggregation of outputs

In this step, the derived habitat suitability membership functions from each rule are combined into one fuzzy set. Usually, the OR (max) operator is applied to aggregate the same output fuzzy sets of the previous step. For example, the f4 (hs) is derived in the previous example two times by the IF-THEN rules. The final fuzzy set representing each habitat suitability class Fj would be

![2](https://cloud.githubusercontent.com/assets/21544603/18667370/f0c043fc-7f38-11e6-9f21-ffd84db5a963.png)

d. Defuzzification

This final step is applied to derive one single habitat suitability value, by combining the membership degrees of all fuzzy habitat suitability classes. Among the various defuzzification methods, the ‘centroid’, ‘maximum membership’, ‘weighted average’ and ‘mean-max membership methods’ are described below.


i. Centroid defuzzification:

Usually called the ‘center of gravity’ or ‘center of area’. It can be defined by the algebraic expression

![3](https://cloud.githubusercontent.com/assets/21544603/18667467/5b1d364c-7f39-11e6-9a3f-d54895c8bfe9.png)

which can be numerically approximated by

![4](https://cloud.githubusercontent.com/assets/21544603/18667566/cf67178e-7f39-11e6-87ab-d050e6e49c13.png)

where,  
f(xi) is the membership degree at value xi  

ii. Maximum membership defuzzification - This is the maximum membership degree observed by the aggregation step:

![5](https://cloud.githubusercontent.com/assets/21544603/18667664/30fee6e8-7f3a-11e6-8f7f-43ee3928802c.png)

iii. Weighted average - This method can be used only for symmetrical output membership functions and is calculated by weighting each output membership function by its largest membership degree:

![6](https://cloud.githubusercontent.com/assets/21544603/18667732/7ffba75e-7f3a-11e6-9d3d-566e7cf69b7a.png)

where,
f(xi) is the membership degree at the average value xi of each membership function 

iv. Mean of maximum - This method resembles the ‘maximum membership’ method. However, the maximum membership degree may not be unique but a range of degrees, from which the mean value is derived: 

![7](https://cloud.githubusercontent.com/assets/21544603/18667853/e8ce89a4-7f3a-11e6-8af5-dca47e97c25e.png)

where,  
xa is the first value reaching the highest membership degree of the class with the highest membership and  
xb is the last value with the highest membership degree of the class with the highest membership  
  
![figure_2](https://cloud.githubusercontent.com/assets/21544603/18667963/7fb858b8-7f3b-11e6-86f9-1304e3892253.png)

### 2. Dependencies
  
All the necessary files to run HABFUZZ are included in the program’s folder. However, to modify the code, users will need to have a FORTRAN text editor and a FORTRAN compiler installed.  
HABFUZZ was developed using:  
•	the Geany text editor (download at www.geany.org)  
•	the GFortran compiler (download at https://gcc.gnu.org/wiki/GFortranBinaries)  
Therefore, it is advised to install the specific additional software to ensure that HABFUZZ is working properly.

### 3. Installing
No specific installation of the software is required. Just copy the HABFUZZ folder to your hard disk and double-click habfuzz.exe to run the program. The HABFUZZ folder includes:  

1. The ‘habfuzz’ subfolder, which contains all the code files of HABFUZZ, which are
a. The fdeclarations.f95 module containing the number of input arrays and all the variables and parameters necessary to run the program.
b. The fuzzifier.f95 subroutine containing the code to apply the fuzzification process (see the ‘usage’ section)
c. The smod.f95, swors.f95 and sopt.f95 subroutines containing the IF-THEN rules according to the management scenario to be implemented (see the ‘usage’ section)
d. The centroid.f95, meanmax.f95, waver.f95 and maxmem.f95 subroutines containing the code to apply the ‘centroid’, ‘mean-max membership’, ‘weighted average’ and ‘maximum membership’ defuzzification processes.

2. The ‘bin’ subfolder, which includes three necessary .dll files to run the software
If the user needs to change the code in one of these files, compilation is necessary prior to running the program. With the gfortran compiler installed, the user can either type the necessary commands


      gfortran -c fdeclarations.f95  
      gfortran -c habfuzz.f95 fdeclarations.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95  
      gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95  

or just run the compile.bat file (included in the ‘habfuzz’ subfolder) to compile (in this case, don’t change the names of files!!!). The compiler will then create the new habfuzz.exe and some .o files, which can be discarded by the user.

### 4. Usage

4.1. Input and output data 

To run HABFUZZ, three different .txt files are required as input, containing the flow velocity values in m/s, the depths in m and substrate types, according to the Manning’s n as depicted in the table. These files should be located in the ‘habfuzz’ subfolder and named velocities.txt, depths.txt and substrates.txt accordingly. Normally, such files (after proper manipulation) are the outputs of a hydrodynamic (hydraulic) simulation, where a specific river reach is numerically simulated through a computational grid. The simulation assigns a value for flow velocity, depth and substrate type at each node of the grid. However, the user can still create his/her own files to use in HABFUZZ. All values at each file should be arranged in a single column, where the first row denotes the number of elements in the row and the rest of the values being the actual data. An example of the three input files containing 10 values (nodes) is shown below.

![fig2](https://cloud.githubusercontent.com/assets/21544603/18668374/b04f156e-7f3d-11e6-81b6-17751808d9b7.png)

![8](https://cloud.githubusercontent.com/assets/21544603/18668406/e04a97e8-7f3d-11e6-9a19-bae1072c71f4.png)

The output of HABFUZZ is a .txt file named suitability.exe containing a single column with all the habitat suitabilities (ranging from 0 - unsuitable to 1 - suitable) calculated for each input element (node) in the same order as with the input files. This file is placed by the program in the ‘habfuzz’ subfolder.  
The habitat suitability is initially a combination of fuzzy membership functions (five classes of suitability - bad, poor, moderate, good and high) and through the defuzzification process it is converted into a crisp output ranging from 0 to 1.

4.2. Running HABFUZZ  

After having the input files ready, double click habfuzz.exe. The command prompt opens and the software asks for the management scenario to be implemented.
