" ipfw syntax file
" Language: ipfw configuration file
" Maintainer: Frans-Jan van Steenbeek <frans-jan@van-steenbeek.net>
" Last Change: 2014 Mar 28
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Comments
syn match   IPFWComment     /#.*$/ contains=ipfwTodo
syn keyword IPFWTodo        TODO XXX FIXME contained

" IPFW keywords
syn keyword IPFWActionBlock deny drop reject unreach unreach6 reset reset6
syn keyword IPFWActionPass  allow accept pass permit
syn keyword IPFWProto       tcp udp icmp icmp6 igmp ipv4 ipv6 all ip
syn keyword IPFWSpecial     frag established bridged dst-port jail ipsec layer2
syn keyword IPFWSpecial     antispoof count divert fwd forward nat pipe queue
syn keyword IPFWSpecial     skipto call return limit
syn match   IPFWSpecial     /check-state/
syn match   IPFWSpecial     /keep-state/
syn keyword IPFWAny         any

" Flow and interfaces
syn keyword IPFWFlow        in out via
syn match   IPFWFlow        /[a-z]\{2,6}[0-9]\{1,}[ab]\{0,1}/

" Addresses
syn match   IPFWIPv4        /\(\d\{1,3}\.\)\{3}\d\{1,3}/
syn match   IPFWIPv6        /\([0-9A-Fa-f]\{1,4}:\)\{7,7}[0-9A-Fa-f]\{1,4}/
syn match   IPFWIPv6        /\([0-9A-Fa-f]\{1,4}:\)\{1,7}:/
syn match   IPFWIPv6        /\([0-9A-Fa-f]\{1,4}:\)\{1,7}\(:[0-9A-Fa-f]\{1,4}\)\{1,7}/
syn match   IPFWIPv6        /::/
syn match   IPFWIPv6        /:\(:[0-9A-Fa-f]\{1,4}\)\{1,7}/
syn match   IPFWIPv64       /::\(ffff:\)\{0,1}\(0:\)\{0,1}\(\d\{1,3}\.\)\{3}\d\{1,3}/
syn match   IPFWIPv64       /\([0-9A-Fa-f]\{1,4}:\)\{1,7}:\(\d\{1,3}\.\)\{3}\d\{1,3}/
syn match   IPFWNetmask     /\/\d\+/
syn match   IPFWNetmask     /%[a-z]\{2,6}[0-9]\{1,}[ab]\{0,1}/
syn match   IPFWNetmask     /%[0-9]\{1,}/

" Actual highlighting
hi def link IPFWComment     Comment
hi def link IPFWTodo        Todo

hi def link IPFWActionBlock PreCondit
hi def link IPFWActionPass  Exception
hi def link IPFWProto       Identifier
hi def link IPFWSpecial     Underlined
hi def link IPFWAny         Type

hi def link IPFWFlow        Special

hi def link IPFWIPv4        String
hi def link IPFWIPv6        String
hi def link IPFWIPv64       String
hi def link IPFWNetmask     Type
