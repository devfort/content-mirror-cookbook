name              "cpan-mirror"
maintainer        "Steve Marshall"
maintainer_email  "steve@nascentguruism.com"
license           "Apache 2.0"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1"
depends           "perl"
depends           "apache2"

recipe "cpan-mirror", "Configures the machine as a mirror of CPAN"
