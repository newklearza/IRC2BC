;********************** IRC 2 BlockChain - newklear 2018 ****************************

alias createGenesisBlock {
  var %irc2bc.rand $+($r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z))
  var %irc2bc.sha $sha512(%irc2bc.rand,0)
  set %irc2bc.block 0
  set %irc2bc.b [ $+ [ %irc2bc.block ] ] $+(%irc2bc.block,$chr(44) $+ $time $+ $chr(160) $+ $date,$chr(44) $+ $+ $+(Bal: $r(100,1000) Push: Pull:),$chr(44) $+ Genesis Block,$chr(44) $+ %irc2bc.sha)
  ; 1. Block no:, 2. time date, 3. DATA, 4. Previous SHA512, 5. New SHA512
  echo -a Genesis Block Created
}

alias createBlock {
  var %ctime $ctime
  var %irc2bc.rand $+($r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z))
  var %irc2bc.sha $sha512(%irc2bc.rand,0)
  var %irc2bc.prevHash $gettok(%irc2bc.b [ $+ [ %irc2bc.block ] ],5,44)
  inc %irc2bc.block
  set %irc2bc.b [ $+ [ %irc2bc.block ] ] $+(%irc2bc.block,$chr(44) $+ $time $+ $chr(160) $+ $date,$chr(44) $+ $+(Bal: $r(10,100) Push: Pull: ),$chr(44) $+ %irc2bc.prevHash,$chr(44) $+ %irc2bc.sha)
  ; 1. Block no:, 2. time date, 3. DATA, 4. Previous SHA512, 5. New SHA512
  echo -a BlockChain updated %irc2bc.block $iif(%irc2bc.block == 1,time,times)
  echo -a BlockChain Created in: $duration($calc($ctime - %ctime))
}

alias createSmartContract {
  var %irc2bc.rand $+($r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z),$r(0,9),$r(a,z))
  var %irc2bc.sha $sha512(%irc2bc.rand,0)
  var %irc2bc.prevHash $gettok(%irc2bc.b [ $+ [ %irc2bc.block ] ],5,44)
}

alias createCreateWallet {

}
