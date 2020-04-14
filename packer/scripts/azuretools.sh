!#/bin/bash
AZ_REPO=$(lsb_release -cs)
DEBIAN_FRONTEND=noninteractive

echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main\" | sudo tee /etc/apt/sources.list.d/azure-cli.list
apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv --keyserver packages.microsoft.com --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
apt-get update && apt-get install azure-cli
