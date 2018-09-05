on *:TEXT:*:#fgfgfg: { 
  inc %bctotal 1
  inc %bctotal. [ $+ [ $address($nick,2) ] ] 1
  var %inf $sha256($nick,0)
  var %bc.hash $+($r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z))
  var %bc.transid $hmac(%bc.hash,%inf,sha256,0)

  if ($istok(%bccount,$address,32)) {
    if (%bc.checkc [ $+ [ $nick ] ] == 1) { goto nextccstep }
    set %bc.checkc [ $+ [ $nick ] ] 1
  }
  %bccount = $addtok(%bccount,$address,32)
  :nextccstep 
  write -ds $+ $nick C:\wamp64\www\IRC2BC\irc2bc.txt

  write C:\wamp64\www\IRC2BC\irc2bc.txt $nick <big>:</big><strong> $1- </strong>@ $time on $chan <br><br> Generated Salt:<strong> $left(%bc.hash,5) ...snip </strong>& User ID:<strong> $left(%inf,5) ...snip  </strong> Transaction no:<strong> %bctotal </strong> consisting of <strong> $numtok(%bccount,32) </strong> Logged Chatters<br><button>View $nick $+ 's Profile </button> <button>Message $nick </button> <button>Whatsapp $nick </button> <button>Like $nick </button> <button> %bctotal. [ $+ [ $address($nick,2) ] ] Log Records </button><br><button>Get Report: $left(%bc.transid,5) ...snip </button><br><br><br>
  ;#User
  ;write C:\wamp64\www\IRC2BC\Users\ $+ $nick $+ .txt $1- $chan $ctime
  ;$iif($exists(C:\wamp64\www\IRC2BC\Users\ $+ $nick $+ .php),,write C:\wamp64\www\IRC2BC\Users\ $+ $nick $+ .php)


}

on *:ACTION:*:#gfgf: { 
  inc %bctotal 1
  inc %bctotal. [ $+ [ $address($nick,2) ] ] 1
  var %inf $sha256($nick,0)
  var %bc.hash $+($r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z))
  var %bc.transid $hmac(%bc.hash,%inf,sha256,0)

  if ($istok(%bccount,$address,32)) {
    if (%bc.checkc [ $+ [ $nick ] ] == 1) { goto nextccstep }
    set %bc.checkc [ $+ [ $nick ] ] 1
  }
  %bccount = $addtok(%bccount,$address,32)
  :nextccstep 
  write -ds $+ $nick C:\wamp64\www\IRC2BC\irc2bc.txt

  write C:\wamp64\www\IRC2BC\irc2bc.txt $nick <big>:</big><strong> $1- </strong>@ $time on $chan <br><br> Generated Salt:<strong> $left(%bc.hash,5) ...snip </strong>& User ID:<strong> $left(%inf,5) ...snip  </strong> Transaction no:<strong> %bctotal </strong> consisting of <strong> $numtok(%bccount,32) </strong> Logged Chatters<br><button>View $nick $+ 's Profile </button> <button>Message $nick </button> <button>Whatsapp $nick </button> <button>Like $nick </button> <button> %bctotal. [ $+ [ $address($nick,2) ] ] Log Records </button><br><button>Get Report: $left(%bc.transid,5) ...snip </button><br><br><br>
  ;#User
  ;write C:\wamp64\www\IRC2BC\Users\ $+ $nick $+ .txt $1- $chan $ctime
  ;$iif($exists(C:\wamp64\www\IRC2BC\Users\ $+ $nick $+ .php),,write C:\wamp64\www\IRC2BC\Users\ $+ $nick $+ .php)

}
