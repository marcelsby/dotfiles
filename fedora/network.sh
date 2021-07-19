# https://www.math.tamu.edu/~comech/tools/linux-slow-dns-lookup/
# https://www.techrepublic.com/article/how-to-disable-ipv6-on-linux/
# sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
# sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Disable the local stub and disable systemd-resolved
# https://fedoraproject.org/wiki/Changes/systemd-resolved#Opting_out_of_.2Fetc.2Fresolv.conf_that_points_to_the_localhost_stub_resolver
sudo ln -sfv /run/NetworkManager/resolv.conf /etc/resolv.conf

sudo systemctl disable --now systemd-resolved.service
sudo systemctl mask systemd-resolved.service

