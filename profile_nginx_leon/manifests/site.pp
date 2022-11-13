###Calling the class
##already Moved to /example/init.pp
include profile_nginx


###Definin the class


class profile_nginx { 
  ###Defining some variables
  $content = "Hi Leon and Elise, this is a proof that you can use DSL to install nginx!!!"
  $message = lookup('message_from_manifest')
  $welcome_page = lookup('nginx_welcome_content')

  notify {'Info':
    message => $message,
  }
  
  package {'nginx':
    ensure => 'installed',
  }
  
  file {'/usr/share/nginx/html/index.html':
  ensure => "present",
  content => $welcome_page,
  mode => "777",
  require => Package['nginx']
  }

  service {'nginx.service':
  ensure => "running",
  enable => "true",
  require => File['/usr/share/nginx/html/index.html']
  }
}
