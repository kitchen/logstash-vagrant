package {"apache2":
    ensure => present,
}

class {"elasticsearch":
    pkg_source   => "/vagrant/elasticsearch-0.20.5.deb",
    java_install => true,
    config       => {
        'node'   => { name => 'logstash-demo' },
    },
    #status => 'disabled',
}

class {"logstash":
    provider    => 'custom',
    jarfile     => '/vagrant/logstash-1.1.9-monolithic.jar',
    installpath => '/usr/share/java/logstash-1.1.9-monolithic.jar',
}
