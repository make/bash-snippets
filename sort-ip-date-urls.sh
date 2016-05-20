cat /var/log/apache2/other_vhosts_access.log | awk '{
  m = gensub(".*/(...)/.*","\\1","g",$5);
  m = (match("JanFebMarAprMayJunJulAugSepOctNovDec",m)+2)/3;
  m = substr("00" m, length(m) + 1, 2);
  print $8 " " gensub("\\[(..)/.../(....):(..:..:..)","\\2-" m "-\\1 \\3","g",$5) " " $2
}' | sort | less
