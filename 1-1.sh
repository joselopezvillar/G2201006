echo Hello World
mkdir -p ./temp/descompresion/2022
unzip datos.zip -d ./temp/descompresion/2022
pushd ./temp/descompresion/2022 || popd
echo "Estes son todos os ficheiros de hashes" > listadodeficheirosdehashes.txt
shopt -s globstar
find . -name "hash.txt" >> listadodeficheirosdehashes.txt
shopt -u globstar
cat listadodeficheirosdehashes.txt > ~/listado
pushd ~ || popd
tar -czvf datos.tar.gz ~/listado temp/descompresion/2022/cartafol*
sudo chown root:root datos.tar.gz
sudo chmod 700 datos.tar.gz
sudo setfacl -m u:o_teu_usuario:rwx datos.tar.gz
sudo getfacl datos.tar.gz
find temp/descompresion/2022 -type f -name "hash.txt" -exec cat {} \; > compendiodehashes.txt
find temp/descompresion/2022/* -maxdepth 1 -type f -name "hash.txt" -delete
ls -R ~/
