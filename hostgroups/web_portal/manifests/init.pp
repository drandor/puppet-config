# -*- tab-width:3;indent-tabs-mode:nil;  -*-
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:
#

class web_portal {

   class {
      "apache::server":             stage => "main";
      "frontend":                   stage => "main";
      "web_portal::configuration":  stage => "configuration";
      "apache::service":            stage => "service";
   }

}
