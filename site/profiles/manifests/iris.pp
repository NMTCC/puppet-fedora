# class profiles::iris
#
# Defines resources needed for IRIS Intern Orientation

class profiles::iris {

  package { 'perl-Moose':
    ensure   => installed,
    provider => 'yum',
  }



}
