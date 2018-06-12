# rhdf5

This R/Bioconductor package provides an interface between HDF5 and R. 

This branch is experimental, exploring how to use a version of HDF5 installed via a mechanism other than Rhdf5lib.  This should be considered unsupported and experimental!

It can be installed via something similar to the following command:

```
BiocInstaller::biocLite('grimbough/rhdf5', 
    ref = "system_lib", 
    configure.args = "PKG_LIBS='/usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5_cpp.so /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5.so -lz'")
```    


## Contact

For bug reports, please register an [issue](https://github.com/grimbough/rhdf5/issues) here on Github. 


## Funding 

Funding for continued development and maintenance of this package is provided by the German Network for Bioinformatics Infrastructure

<a href="http://www.denbi.de"><img src="https://tess.elixir-europe.org/system/content_providers/images/000/000/063/original/deNBI_Logo_rgb.jpg" width="400" align="left"></a>
