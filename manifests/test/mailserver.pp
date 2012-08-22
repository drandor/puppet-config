# -*- tab-width:3;indent-tabs-mode:nil;  -*-
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:
#

node "puppetc02.localdomain" inherits default_node {
   
   include mailserver

}
