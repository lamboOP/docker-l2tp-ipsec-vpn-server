# 0. Port used
- 4500/udp
- 500/udp

# 1. Install docker
Follow guide: https://docs.docker.com/engine/install/ubuntu/
```
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 
sudo apt install docker-compose -y
```
# 2. Setting
- Link: https://github.com/hwdsl2/docker-ipsec-vpn-server
```
git clone https://github.com/hwdsl2/docker-ipsec-vpn-server.git
```
Modify "vpn.env"

```
cd docker-l2tp-ipsec-vpn-server/
cp vpn.env.example vpn.env
vi vpn.env
```
- Modify the user-password default, psk 
  - VPN_IPSEC_PSK=
  - VPN_USER=
  - VPN_PASSWORD=
- Modify the VPN_DNS_SVR
- Modify the user addition to add more user
  - VPN_ADDL_USERS
  - VPN_ADDL_PASSWORDS

=> Eg:
- user/pass default: u1/u1@123
- psk: test_psk
- Addition user/password: u2/u2@123 u3/u3@123 u4/u4@123
- DNS: 8.8.8.8; 8.8.4.4
```
# Note: All the variables to this image are optional.
# See README for more information.
# To use, uncomment and replace with your own values.

# Define IPsec PSK, VPN username and password
# - DO NOT put "" or '' around values, or add space around =
# - DO NOT use these special characters within values: \ " '
VPN_IPSEC_PSK=test_psk
VPN_USER=u1
VPN_PASSWORD=u1@123

# Define additional VPN users
# - DO NOT put "" or '' around values, or add space around =
# - DO NOT use these special characters within values: \ " '
# - Usernames and passwords must be separated by spaces
VPN_ADDL_USERS=u2 u3 u4
VPN_ADDL_PASSWORDS=u2@123 u3@123 u4@123

# Use a DNS name for the VPN server
# - The DNS name must be a fully qualified domain name (FQDN)
# VPN_DNS_NAME=vpn.example.com

# Specify a name for the first IKEv2 client
# - Use one word only, no special characters except '-' and '_'
# - The default is 'vpnclient' if not specified
# VPN_CLIENT_NAME=your_client_name

# Use alternative DNS servers
# - By default, clients are set to use Google Public DNS
# - Example below shows Cloudflare's DNS service
VPN_DNS_SRV1=8.8.8.8
VPN_DNS_SRV2=8.8.4.4

# Protect IKEv2 client config files using a password
# - By default, no password is required when importing IKEv2 client configuration
# - Uncomment if you want to protect these files using a random password
# VPN_PROTECT_CONFIG=yes
```
# 3. Run Docker
```
docker-compose up -d
```