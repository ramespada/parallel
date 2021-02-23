import h5py

f=h5py.File("file.hdf5")

#Dataset (name, shape & datatype)
dset=f.create_dataset("miData", (10,10), dtype='f')
dset[0,3]=2.3   # altero el dataset.

#Attributes (keys, values, items)
#dset.attrs={'station': "Ezeiza",'idwmo': 36553,'lat': -34.3,'lon': -58.3,'h': 3}
dset.attrs['estacion']="Ezeiza"
dset.attrs['id']=36553
dset.attrs['lat']=-34.5
dset.attrs['lon']=-58.2

#Groups
grp= f.create_group("miGrupo")

subgrp=grp.create_group("miSubGrupo")

dset2=f.create_dataset("/miGrupo2/miSubgrupo2/miData2",(3,4,2),dtype='f')
dset2[0,1:,1:]=1.4
dset2.attrs['nombre']="JuanC"

f.close()
