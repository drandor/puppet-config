# -*- tab-width:3;indent-tabs-mode:nil;  -*-
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:
#

node "puppetc01.localdomain" inherits default_node {
   
   include web_portal

}
