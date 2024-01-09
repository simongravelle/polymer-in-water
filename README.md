# Data file for NMRforMD

<a href="webp">
  <img src="https://raw.githubusercontent.com/simongravelle/nmrformd/main/docs/source/figures/logo/logo-b.png" align="right" width="30%"/>
</a>

Raw trajectory files used for the 
isotropic tutorial of [nmrformd](https://nmrformd.readthedocs.io).
The GROMACS input files and topology are also given.

## Simulation

<a href="webp">
<img src="https://raw.githubusercontent.com/simongravelle/nmrformd/main/docs/source/figures/tutorials/isotropic-systems/snapshot.png" align="right" width="32%" />
</a>

The system is made of a bulk mixture of 320 $\text{TIP4P}-\epsilon$ water molecules
and 32 $\text{PEG}300$ polymer molecules. The trajectory was recorded
during a $10\,\text{ns}$ production run performed with the open source code LAMMPS
in the NPT ensemble using a timestep of $1\,\text{fs}$.
The imposed was temperature $T = 300\,^\circ\text{K}$, and the pressure
$p = 1\,\text{atm}$. The positions of the atoms were recorded in
the *prod.xtc* file every $1\,\text{ps}$.

## Acknowledgments

This project has received funding from the European
Union's Horizon 2020 research and innovation programme
under the Marie Skłodowska-Curie grant agreement No 101065060.

![MSCA image](https://raw.githubusercontent.com/simongravelle/nmrformd/main/docs/source/figures/logo/msca.png)

