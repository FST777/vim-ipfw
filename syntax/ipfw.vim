" ipfw syntax file
" Language: ipfw configuration file
" Maintainer: Frans-Jan van Steenbeek <frans-jan@van-steenbeek.net>
" Contributor: toxicalice <chaoticmurlock@gmail.com>
" Last Change: 2017 Jun 04
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Comments
syn match   IPFWComment     /#.*$/ contains=ipfwTodo
syn match   IPFWComment     /\/\/.*$/
syn keyword IPFWTodo        TODO XXX FIXME contained

" IPFW keywords
syn keyword IPFWInstruction add list show pipe queue sched config log tag untag
syn keyword IPFWInstruction altq prob
syn keyword IPFWActionBlock deny drop reject unreach unreach6 reset reset6
syn keyword IPFWActionPass  allow accept pass permit
syn keyword IPFWGroup       set table
syn keyword IPFWGroupOp     disable enable move rule swap show create destroy
syn keyword IPFWGroupOp     modify swap add atomic delete lookup lock unlock
syn keyword IPFWGroupOp     flush
syn keyword IPFWProto       tcp udp icmp icmp6 igmp ipv4 ipv6 all ip
syn keyword IPFWSpecial     frag established bridged tablearg jail ipsec layer2
syn keyword IPFWSpecial     antispoof count divert fwd forward nat pipe queue
syn keyword IPFWSpecial     skipto call return limit reass tee netgraph ngtee
syn keyword IPFWSpecial     setfib setdscp not addr icmptypes icmp6types
syn keyword IPFWSpecial     ipoptions iplen ipprecedence ipsec iptos dscp spec
syn keyword IPFWSpecial     ipttl ipversion mac proto recv xmit setup sockarg
syn keyword IPFWSpecial     tagged tcpack tcpflags tcpseq tcpwin tcpoptions
syn keyword IPFWSpecial     iface number flow type valtype algo locked radix
syn keyword IPFWSpecial     hash array ext6hdr
syn match   IPFWSpecial     /src-ip/
syn match   IPFWSpecial     /src-ip6/
syn match   IPFWSpecial     /src-port/
syn match   IPFWSpecial     /dst-ip/
syn match   IPFWSpecial     /dst-ip6/
syn match   IPFWSpecial     /dst-port/
syn match   IPFWSpecial     /mac-type/
syn match   IPFWSpecial     /check-state/
syn match   IPFWSpecial     /keep-state/
syn keyword IPFWMe          me me6
syn keyword IPFWAny         any

" Flow and interfaces
syn keyword IPFWFlow        in out via
syn match   IPFWFlow        /[a-z]\{2,6}[0-9]\{1,}[ab]\{0,1}/

" Addresses
syn match   IPFWMAC         /\(\d\{2}:\)\{5}\d\{2}/
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

hi def link IPFWInstruction PreProc
hi def link IPFWGroup       Type
hi def link IPFWGroupOp     PreProc
hi def link IPFWActionBlock Operator
hi def link IPFWActionPass  Exception
hi def link IPFWProto       Identifier
hi def link IPFWSpecial     Special
hi def link IPFWMe          Constant
hi def link IPFWAny         Constant

hi def link IPFWFlow        Special

hi def link IPFWMAC         String
hi def link IPFWIPv4        String
hi def link IPFWIPv6        String
hi def link IPFWIPv64       String
hi def link IPFWNetmask     Type
