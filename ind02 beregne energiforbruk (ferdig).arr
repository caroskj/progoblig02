use context essentials2021
include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"


# a) bruker sanitize for å data i kolonnen energi til å returneres som String.

kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end


# b) funksjon som overfører data fra String til Number. Brukt cases og string-to-numbers. Begge testene i where tilfrdsstilles. 

fun energi-to-number(str :: String) -> Number:
  doc: "Konverterer verdier fra String til Number"
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
  energi-to-number("") is 0
  energi-to-number("48") is (48)
end


# c) transform-colum endre alle String-verdiene til tall i kolonnen energi. 

energi-riktig = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

energi-riktig

#count(energi-riktig, "energi") #??


# d) summerer tallene i kolonnen "energi".

sum(energi-riktig, "energi")


# e) funkjsonen lager et illustrativt stolpediagram av de ulike komponentene med sitt respektive energiforbruk.
bar-chart(energi-riktig, "komponent", "energi")



