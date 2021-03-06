name              "content-mirror"
maintainer        "Steve Marshall"
maintainer_email  "steve@nascentguruism.com"
license           "Apache 2.0"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue "0.1.0"
depends           "mirror-core"

recipe "content-mirror", "Configures the machine as a mirror of various sources of static content."
