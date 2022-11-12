###Calling the class
##already Moved to /example/init.pp
include profile_nginx


###Definin the class


class profile_nginx { 
  ###Defining some variables
  $content = "Hi Leon and Elise, this is a proof that you can use DSL to install nginx!!!"
  

  notify {'Info':
    message => "Hello from $hostname, we are now installing nginx now..",
  }
  
  package {'nginx':
    ensure => 'installed',
    
  }
  
  file {'/usr/share/nginx/html/index.html':
  ensure => "present",
  content => $content,
  mode => "777",
  require => Package['nginx']

  }

  service {'nginx.service':
  ensure => "running",
  enable => "true",
  require => File['/usr/share/nginx/html/index.html']

  }


}
