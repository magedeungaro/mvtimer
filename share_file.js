const fs = require("fs");

let mvps_array = [
  ["Orc Herói", "1h", "gef_fild03", 3600000],
  ["Maya", "2h", "anthell02 ", 7200000],
  ["Maya", "8h", "gld_dun03 ", 28800000],
  ["Maya", "8h", "gld_dun02_2", 28800000],
  ["Senhor dos Orcs", "2h", "gef_fild10", 7200000],
  ["Besouro-ladrão Dourado", "1h", "prt_sewb4", 3600000],
  ["Eddga", "2h", "pay_fild10", 7200000],
  ["Eddga", "8h", "gld_dun01 ", 28800000],
  ["Eddga", "8h", "gld_dun01_2", 28800000],
  ["Osíris", "1h", "moc_pryd04", 3600000],
  ["Amon Ra", "1h", "moc_pryd06", 3600000],
  ["Freeoni", "2h", "moc_fild17", 7200000],
  ["Drácula", "1h", "gef_dun01", 3600000],
  ["Doppelganger", "2h", "gef_dun02 ", 7200000],
  ["Doppelganger", "8h", "gld_dun02 ", 28800000],
  ["Doppelganger", "8h", "gld_dun04", 28800000],
  ["Abelha-rainha", "2h", "mjolnir_04 ", 7200000],
  ["Abelha-rainha", "8h", "gld_dun02", 28800000],
  ["Flor do Luar", "1h", "pay_dun04 ", 3600000],
  ["Flor do Luar", "8h", "gld_dun01", 28800000],
  ["Lady Tanee", "7h", "ayo_dun02", 25200000],
  ["Bafomé", "2h", "prt_maze03 ", 7200000],
  ["Bafomé", "8h", "gld_dun03", 28800000],
  ["Faraó", "1h", "in_sphinx5", 3600000],
  ["Drake", "2h", "treasure02", 7200000],
  ["Cavaleiro da Tempestade", "1h", "xmas_dun02", 3600000],
  ["Boitatá", "2h", "bra_dun02", 7200000],
  ["Leak", "2h", "dew_dun01", 7200000],
  ["Senhor dos Mortos", "2:13h", "Nifflheim", 7980000],
  ["Senhor das Trevas", "1h", "gl_chyard ", 3600000],
  ["Senhor das Trevas", "1h", "gl_chyard_ ", 3600000],
  ["Senhor das Trevas", "8h", "gld_dun04 ", 28800000],
  ["Senhor das Trevas", "8h", "gld_dun04_2", 28800000],
  ["Gorynych", "2h", "mosk_dun03", 7200000],
  ["Lady Branca", "1:56h", "lou_dun03", 6960000],
  ["Hatii", "2h", "xmas_fild01", 7200000],
  ["Ktullanux", "2h", "ice_dun03", 7200000],
  ["Memória de Thanatos", "2h", "Torre de Thanatos", 7200000],
  ["Superaprendiz", "2h", "teg_dun02", 7200000],
  ["Aprendiz", "8h", "teg_dun01", 28800000],
  ["RSX-0806", "2:05h", "ein_dun02", 7500000],
  ["Samurai Encarnado", "1:31h", "ama_dun03", 5460000],
  ["Serpente Suprema", "1:34h", "gon_dun03", 5640000],
  ["Tao Gunka", "5h", "beach_dun", 18000000],
  ["General Tartaruga", "1h", "tur_dun04", 3600000],
  ["Atroce", "3h", "ra_fild03 ", 10800000],
  ["Atroce", "5h", "ra_fild04 ", 18000000],
  ["Atroce", "3h", "ve_fild01 ", 10800000],
  ["Atroce", "6h", "ve_fild02 ", 21600000],
  ["Atroce", "8h", "gld_dun03_2", 28800000],
  ["Kraken", "2:20h", "iz_dun05", 8400000],
  ["Kiel-D-01", "2h", "kh_dun02", 7200000],
  ["Vesper", "2h", "jupe_core", 7200000],
  ["Detardeurus", "3h", "abyss_03", 10800000],
  ["Bispo Decadente", "2h", "abbey02", 7200000],
  ["Pesar Noturno", "5h", "ra_san05", 18000000],
  ["Rainha Scaraba", "2h", "dic_dun02", 7200000],
  ["Rainha Scaraba Dourada", "2h", "dic_dun03", 7200000],
  ["Amon Ra Pesadelo", "1h", "moc_prydn2", 3600000],
  ["Egnigen Cenia", "2h", "lhz_dun02", 7200000],
  ["Valquíria Randgris", "8h", "odin_tem03", 28800000],
  ["Pyuriel Furiosa", "8h", "gld2_prt", 28800000],
  ["General Daehyun", "8h", "gld2_pay", 28800000],
  ["Guardião Morto Kades", "8h", "gld2_gef", 28800000],
  ["Gioia", "8h", "gld2_ald", 28800000],
  ["Ifrit", "11h", "thor_v03", 39600000],
  ["Belzebu", "12h", "abbey03", 43200000],
  ["Bafomé Amaldiçoado", "2h", "gl_cas02_", 7200000],
  ["Morroc Ferido", "12h", "moc_fild22", 43200000],
  ["Vigia do Tempo", "2h", "c_tower3_", 7200000],
  ["Gemaring", "1h", "lasa_dun01", 3600000],
];

let link_pattern =
  "https://github.com/mostvaluabletimer/mostvaluabletimer.github.io/raw/master/img/mvp/";
let props = ["name", "delete", "map_id", "interval", "photo"];
let mvps = [];
let tempobj = {};

for (let i = 0; i < mvps_array.length; i++) {
  for (let j = 0; j < props.length; j++) {
    tempobj[props[j]] = mvps_array[i][j];
    if (props[j] == "photo") {
      tempobj[props[j]] = link_pattern + [i] + ".gif";
    }
  }
  mvps.push(tempobj);
  console.log(tempobj);
  tempobj = {};
}

fs.writeFile("monsters.json", JSON.stringify(mvps), function (err) {
  if (err) throw err;
  console.log("Saved!");
});
