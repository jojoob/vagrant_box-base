timezone="Europe/Berlin"
locale="en_US.UTF-8"

locale-gen $locale
# Postfix expect locales in /etc/default/locales
update-locale LC_ALL=$locale LANG=$locale

export LANG=$locale
export LC_ALL=$locale

echo $timezone > /etc/timezone && dpkg-reconfigure tzdata

apt-get update
apt-get -y upgrade
