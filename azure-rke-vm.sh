1. Deploy 5 machines using the script
2. Run the following comamnds in all the 5 nodes under root.
sudo usermod -aG docker adminsai
sudo usermod -aG root adminsai
sudo systemctl daemon-reload
sudo systemctl restart docker.service
3. Perform rke up



RG=K8SB12
echo "Creating Azure Resource Group"
az group create --location eastus -n ${RG}

echo "Creating Azure Virtual Network"
az network vnet create -g ${RG} -n ${RG}-vNET1 --address-prefix 10.1.0.0/16 \
--subnet-name ${RG}-Subnet-1 --subnet-prefix 10.1.1.0/24 -l eastus
#Creating Master Servers
for I in {1..3}; do
    az vm create --resource-group ${RG} --name master0$I --image UbuntuLTS --vnet-name ${RG}-vNET1 \
    --subnet ${RG}-Subnet-1 --admin-username adminsree --admin-password "India@123456" --size Standard_B2s \
    --nsg "" --custom-data ./clouddrive/k8sb12.txt
done

#Creating Worker Nodes
for I in {1..3}; do
    az vm create --resource-group ${RG} --name worker0$I --image UbuntuLTS --vnet-name ${RG}-vNET1 \
    --subnet ${RG}-Subnet-1 --admin-username adminsree --admin-password "India@123456" --size Standard_B2s \
    --nsg "" --custom-data ./clouddrive/k8sb12.txt
done

watch ls
