use context essentials2021
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

# Tabell som beskrive de ulike forholdene i de nordiske flaggene. Tanken var å bruke disse verdiene i en funksjon for å bestemme forhold og størrelse. Jeg har ikke fått dette til i praksis. 

# Utfordringene jeg ikke klarte å løse var: 
# 1. hvordan jeg kunne hente ut dataene om forholdene og bruke dem i en "standard"-funkjson.
# 2. hvordan jeg videre skulle løse plasseringsproblemet for de nye verdiene ved bruk av put-image, for de plasseres ikke likt i rammen. Vurdert å lage ny tabell med disse veridene eller lage ny kolonne i eksisterende tabell med navn "plassering".


nordic-flags-table = table: country :: String, height :: Number, length :: Number, cross-ll-w :: Number, cross-ss-w :: Number
  row: "norway", 16, 22, 4, 2
  row: "faroe-islands", 16, 22, 4, 2
  row: "iceland", 18, 25, 4, 2
  row: "denmark", 28, 37, 4, 0 
  row: "sweden", 10, 16, 2, 0
  row: "finland", 11, 18, 3, 0
end


# Under finnes revidert funksjon av den første flagg funksjonen for å tegne det norske flagget. I den nye versjonen plasserers kors i to størrelser (to rektangeler per kors) som er flyttbare i stedet for x-antall frittstående rektangeler. Basen er nå flagget hovedfarge altså hjørne-fargene. 

# I denne funksjoen er forholdene basert på de norske forholdene. Tanken var at denne funksjonen skulle kunne tilpasses ved bruk av tabellen over, men dette har jeg ikke fått til. 

fun nordic-flags(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of flags for the nordic countries"
  frame(
    put-image(rectangle(220, 20, "solid", cross-s), 110, 80, 
      put-image(rectangle(20, 160, "solid", cross-s), 80, 80,
        put-image(rectangle(220, 40, "solid", cross-l), 110, 80,
          put-image(rectangle(40, 160, "solid", cross-l), 80, 80,
            rectangle(220, 160, "solid", base))))))
end

# Definisjon på farger brukt i flaggene

norway = nordic-flags("red", "dark-blue", "white")
faroe-islands = nordic-flags("white", "red", "dark-blue")
iceland = nordic-flags("navy", "red", "white")
sweden = nordic-flags("cornflower-blue", "gold", "cornflower-blue")
denmark = nordic-flags("red", "white", "white")
finland = nordic-flags("white", "royal-blue", "royal-blue")


# Under har jeg laget én funksjon per flagg basert på forholdene til det respektive flagget.


# Det svenske flagget
fun swedish-flag(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of the Swedish flag"
  frame(
    put-image(rectangle(160, 20, "solid", cross-s), 80, 50, 
      put-image(rectangle(20, 100, "solid", cross-s), 60, 50,
        put-image(rectangle(160, 40, "solid", cross-l), 80, 50,
          put-image(rectangle(40, 100, "solid", cross-l), 60, 50,
            rectangle(160, 100, "solid", base))))))
end

swedish = swedish-flag("cornflower-blue", "gold", "cornflower-blue")

# Det islandske flagget
fun icelandic-flag(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of the Icelandic flag"
  frame(
    put-image(rectangle(250, 20, "solid", cross-s), 125, 90, 
      put-image(rectangle(20, 180, "solid", cross-s), 90, 90,
        put-image(rectangle(250, 40, "solid", cross-l), 125, 90,
          put-image(rectangle(40, 180, "solid", cross-l), 90, 90,
            rectangle(250, 180, "solid", base))))))
end

icelandic = icelandic-flag("navy", "red", "white")

# Det finske flagget
fun finnish-flag(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of the Finnish flag"
  frame(
    put-image(rectangle(180, 30, "solid", cross-s), 90, 55, 
      put-image(rectangle(30, 110, "solid", cross-s), 65, 55,
        put-image(rectangle(180, 0, "solid", cross-l), 125, 90,
          put-image(rectangle(0, 110, "solid", cross-l), 90, 90,
            rectangle(180, 110, "solid", base))))))
end

finnish = finnish-flag("white", "royal-blue", "white")


# Det norske flagget
fun norwegian-flag(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of the Norwegian flag"
  frame(
    put-image(rectangle(220, 20, "solid", cross-s), 110, 80, 
      put-image(rectangle(20, 160, "solid", cross-s), 80, 80,
        put-image(rectangle(220, 40, "solid", cross-l), 110, 80,
          put-image(rectangle(40, 160, "solid", cross-l), 80, 80,
            rectangle(220, 160, "solid", base))))))
end

norwegian = norwegian-flag("red", "dark-blue", "white")


# Det danske flagget
fun danish-flag(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of the Finnish flag"
  frame(
    put-image(rectangle(370, 40, "solid", cross-s), 185, 140, 
      put-image(rectangle(40, 280, "solid", cross-s), 140, 140,
        put-image(rectangle(370, 0, "solid", cross-l), 185, 140,
          put-image(rectangle(0, 280, "solid", cross-l), 140, 140,
            rectangle(370, 280, "solid", base))))))
end

danish = danish-flag("red", "white", "red")


# Det færøyske flagget
fun faroese-flag(base :: String, 
    cross-s :: String, 
    cross-l :: String) -> Image:
  doc: "Draw image of the Finnish flag"
  frame(
    put-image(rectangle(220, 20, "solid", cross-s), 110, 80, 
      put-image(rectangle(20, 160, "solid", cross-s), 80, 80,
        put-image(rectangle(220, 40, "solid", cross-l), 110, 80,
          put-image(rectangle(40, 160, "solid", cross-l), 80, 80,
            rectangle(220, 160, "solid", base))))))
end

faroese = faroese-flag("white", "red", "dark-blue")


# Funksjon som kan tegne flaggene med riktige forhold basert på funksjonene over. Det er også mulig å bare skrive inn for eksempel "faroese" og få tegnet det færøyske flagget i stedet for å bruke funksjonen. 

fun draw-flag(flag-name) -> Image:
  if flag-name == finnish:
    finnish
  else if flag-name == swedish:
    swedish
  else if flag-name == icelandic:
    icelandic
  else if flag-name == norwegian:
    norwegian
  else if flag-name == danish:
    danish
  else if flag-name == faroese:
    faroese
  else: "Prøv igjen! :-)"
  end
end