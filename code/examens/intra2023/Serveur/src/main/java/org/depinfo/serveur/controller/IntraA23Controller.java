package org.depinfo.serveur.controller;

import org.depinfo.serveur.model.Chanson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class IntraA23Controller {

    @GetMapping("/exam/artiste/recherche/{terme}")
    public @ResponseBody List<Chanson> rechercherChanson(@PathVariable String terme) {
        return chansons.stream()
                .filter((Chanson chanson) -> chanson.titre.toUpperCase().contains(terme.toUpperCase()))
                .collect(Collectors.toList());
    }

    private static final List<Chanson> chansons = Arrays.asList(new Chanson() {{
        id = 1;
        titre = "-M-";
    }}, new Chanson() {{
        id = 2;
        titre = "21 Savage";
    }}, new Chanson() {{
        id = 3;
        titre = "86 Joon";
    }}, new Chanson() {{
        id = 4;
        titre = "8ruki";
    }}, new Chanson() {{
        id = 5;
        titre = "A-WA";
    }}, new Chanson() {{
        id = 6;
        titre = "ALASKALASKA";
    }}, new Chanson() {{
        id = 7;
        titre = "AaRON";
    }}, new Chanson() {{
        id = 8;
        titre = "Acid Arab";
    }}, new Chanson() {{
        id = 9;
        titre = "Adekunle Gold";
    }}, new Chanson() {{
        id = 10;
        titre = "Ady Suleiman";
    }}, new Chanson() {{
        id = 11;
        titre = "Adé";
    }}, new Chanson() {{
        id = 12;
        titre = "Afida Turner";
    }}, new Chanson() {{
        id = 13;
        titre = "Agoria";
    }}, new Chanson() {{
        id = 14;
        titre = "Aime Simone";
    }}, new Chanson() {{
        id = 15;
        titre = "Air";
    }}, new Chanson() {{
        id = 16;
        titre = "Ajebo Hustlers";
    }}, new Chanson() {{
        id = 17;
        titre = "Akon";
    }}, new Chanson() {{
        id = 18;
        titre = "Al Green";
    }}, new Chanson() {{
        id = 19;
        titre = "Alan Braxe";
    }}, new Chanson() {{
        id = 20;
        titre = "Alan Fitzpatrick";
    }}, new Chanson() {{
        id = 21;
        titre = "Alan Mills";
    }}, new Chanson() {{
        id = 22;
        titre = "Albert Newton";
    }}, new Chanson() {{
        id = 23;
        titre = "Alejandro Sanz";
    }}, new Chanson() {{
        id = 24;
        titre = "Aleks Syntek";
    }}, new Chanson() {{
        id = 25;
        titre = "Alfred.";
    }}, new Chanson() {{
        id = 26;
        titre = "Aliocha Schneider";
    }}, new Chanson() {{
        id = 27;
        titre = "Alt Bloom";
    }}, new Chanson() {{
        id = 28;
        titre = "Ama Lou";
    }}, new Chanson() {{
        id = 29;
        titre = "Amarante";
    }}, new Chanson() {{
        id = 30;
        titre = "Amaury";
    }}, new Chanson() {{
        id = 31;
        titre = "Ananda Shankar";
    }}, new Chanson() {{
        id = 32;
        titre = "Anderson .Paak";
    }}, new Chanson() {{
        id = 33;
        titre = "Andre Proulx et ses musiciens";
    }}, new Chanson() {{
        id = 34;
        titre = "Andrea Vanzo";
    }}, new Chanson() {{
        id = 35;
        titre = "Andrew Lloyd Webber";
    }}, new Chanson() {{
        id = 36;
        titre = "AndrÉ Lejeune";
    }}, new Chanson() {{
        id = 37;
        titre = "André Bertrand";
    }}, new Chanson() {{
        id = 38;
        titre = "André Brunet";
    }}, new Chanson() {{
        id = 39;
        titre = "André Gagnon";
    }}, new Chanson() {{
        id = 40;
        titre = "André Verreault";
    }}, new Chanson() {{
        id = 41;
        titre = "Ane Brun";
    }}, new Chanson() {{
        id = 42;
        titre = "Angie Stone";
    }}, new Chanson() {{
        id = 43;
        titre = "Angus & Julia Stone";
    }}, new Chanson() {{
        id = 44;
        titre = "Angèle";
    }}, new Chanson() {{
        id = 45;
        titre = "Angèle Arsenault";
    }}, new Chanson() {{
        id = 46;
        titre = "Anitta";
    }}, new Chanson() {{
        id = 47;
        titre = "Anonymuz";
    }}, new Chanson() {{
        id = 48;
        titre = "Apashe";
    }}, new Chanson() {{
        id = 49;
        titre = "Arcade Fire";
    }}, new Chanson() {{
        id = 50;
        titre = "Arctic Monkeys";
    }}, new Chanson() {{
        id = 51;
        titre = "Areski Belkacem";
    }}, new Chanson() {{
        id = 52;
        titre = "Aretha Franklin";
    }}, new Chanson() {{
        id = 53;
        titre = "ArmstrongWW";
    }}, new Chanson() {{
        id = 54;
        titre = "Arthur Lee";
    }}, new Chanson() {{
        id = 55;
        titre = "Asaf Avidan";
    }}, new Chanson() {{
        id = 56;
        titre = "Asake";
    }}, new Chanson() {{
        id = 57;
        titre = "Ash";
    }}, new Chanson() {{
        id = 58;
        titre = "Astrid Hadad";
    }}, new Chanson() {{
        id = 59;
        titre = "Avec pas d'casque";
    }}, new Chanson() {{
        id = 60;
        titre = "BADBADNOTGOOD";
    }}, new Chanson() {{
        id = 61;
        titre = "Baby Gang";
    }}, new Chanson() {{
        id = 62;
        titre = "Bad Bunny";
    }}, new Chanson() {{
        id = 63;
        titre = "Badfinger";
    }}, new Chanson() {{
        id = 64;
        titre = "Barbara";
    }}, new Chanson() {{
        id = 65;
        titre = "Bas";
    }}, new Chanson() {{
        id = 66;
        titre = "Bathe Alone";
    }}, new Chanson() {{
        id = 67;
        titre = "Bayuk";
    }}, new Chanson() {{
        id = 68;
        titre = "Beach House";
    }}, new Chanson() {{
        id = 69;
        titre = "Beau Dommage";
    }}, new Chanson() {{
        id = 70;
        titre = "Bebe";
    }}, new Chanson() {{
        id = 71;
        titre = "Bee Gees";
    }}, new Chanson() {{
        id = 72;
        titre = "Belinda";
    }}, new Chanson() {{
        id = 73;
        titre = "Bengous";
    }}, new Chanson() {{
        id = 74;
        titre = "Benjamin Amaru";
    }}, new Chanson() {{
        id = 75;
        titre = "Benjamin Diamond";
    }}, new Chanson() {{
        id = 76;
        titre = "Benoit Paradis Trio";
    }}, new Chanson() {{
        id = 77;
        titre = "Bernard Adamus";
    }}, new Chanson() {{
        id = 78;
        titre = "Bernard Lavalette";
    }}, new Chanson() {{
        id = 79;
        titre = "Bert Jansch";
    }}, new Chanson() {{
        id = 80;
        titre = "Bertrand Gosselin";
    }}, new Chanson() {{
        id = 81;
        titre = "Beyoncé";
    }}, new Chanson() {{
        id = 82;
        titre = "Big Brother & The Holding Company";
    }}, new Chanson() {{
        id = 83;
        titre = "Big Thief";
    }}, new Chanson() {{
        id = 84;
        titre = "Biga*Ranx";
    }}, new Chanson() {{
        id = 85;
        titre = "Billy Joel";
    }}, new Chanson() {{
        id = 86;
        titre = "Bing Crosby";
    }}, new Chanson() {{
        id = 87;
        titre = "Björk";
    }}, new Chanson() {{
        id = 88;
        titre = "Black Coffee";
    }}, new Chanson() {{
        id = 89;
        titre = "Black Eyed Peas";
    }}, new Chanson() {{
        id = 90;
        titre = "Blanka";
    }}, new Chanson() {{
        id = 91;
        titre = "Bleu Jeans Bleu";
    }}, new Chanson() {{
        id = 92;
        titre = "Blxst";
    }}, new Chanson() {{
        id = 93;
        titre = "Bnxn";
    }}, new Chanson() {{
        id = 94;
        titre = "Bo Diddley";
    }}, new Chanson() {{
        id = 95;
        titre = "Bob Destiny";
    }}, new Chanson() {{
        id = 96;
        titre = "Bob Dylan";
    }}, new Chanson() {{
        id = 97;
        titre = "Bobbie Gentry";
    }}, new Chanson() {{
        id = 98;
        titre = "Bobby Hebb";
    }}, new Chanson() {{
        id = 99;
        titre = "Bobo";
    }}, new Chanson() {{
        id = 100;
        titre = "Bodikhuu";
    }}, new Chanson() {{
        id = 101;
        titre = "Bon Débarras";
    }}, new Chanson() {{
        id = 102;
        titre = "Bon Entendeur";
    }}, new Chanson() {{
        id = 103;
        titre = "Bredelers";
    }}, new Chanson() {{
        id = 104;
        titre = "Brian Protheroe";
    }}, new Chanson() {{
        id = 105;
        titre = "Brigitte Bardot";
    }}, new Chanson() {{
        id = 106;
        titre = "Brigitte Fontaine";
    }}, new Chanson() {{
        id = 107;
        titre = "Britney Spears";
    }}, new Chanson() {{
        id = 108;
        titre = "Bruce Reitherman";
    }}, new Chanson() {{
        id = 109;
        titre = "Bruce Springsteen";
    }}, new Chanson() {{
        id = 110;
        titre = "Bruno Mars";
    }}, new Chanson() {{
        id = 111;
        titre = "Bryan Adams";
    }}, new Chanson() {{
        id = 112;
        titre = "Buddy Holly";
    }}, new Chanson() {{
        id = 113;
        titre = "Buena Vista Social Club";
    }}, new Chanson() {{
        id = 114;
        titre = "Burna Boy";
    }}, new Chanson() {{
        id = 115;
        titre = "C.Cole";
    }}, new Chanson() {{
        id = 116;
        titre = "CRi";
    }}, new Chanson() {{
        id = 117;
        titre = "Cage The Elephant";
    }}, new Chanson() {{
        id = 118;
        titre = "Calvin Harris";
    }}, new Chanson() {{
        id = 119;
        titre = "Camp Claude";
    }}, new Chanson() {{
        id = 120;
        titre = "Canailles";
    }}, new Chanson() {{
        id = 121;
        titre = "Captain Beefheart";
    }}, new Chanson() {{
        id = 122;
        titre = "Cardellino";
    }}, new Chanson() {{
        id = 123;
        titre = "Carlos Jean";
    }}, new Chanson() {{
        id = 124;
        titre = "Carotté";
    }}, new Chanson() {{
        id = 125;
        titre = "Casper Magico";
    }}, new Chanson() {{
        id = 126;
        titre = "Cayouche";
    }}, new Chanson() {{
        id = 127;
        titre = "CeCe Peniston";
    }}, new Chanson() {{
        id = 128;
        titre = "Celeste";
    }}, new Chanson() {{
        id = 129;
        titre = "Cerrone";
    }}, new Chanson() {{
        id = 130;
        titre = "Cesária Evora";
    }}, new Chanson() {{
        id = 131;
        titre = "Charles Aznavour";
    }}, new Chanson() {{
        id = 132;
        titre = "Charlotte Cardin";
    }}, new Chanson() {{
        id = 133;
        titre = "Charlotte Lawrence";
    }}, new Chanson() {{
        id = 134;
        titre = "Chencho Corleone";
    }}, new Chanson() {{
        id = 135;
        titre = "Cheryl Lynn";
    }}, new Chanson() {{
        id = 136;
        titre = "Childish Gambino";
    }}, new Chanson() {{
        id = 137;
        titre = "Chilla";
    }}, new Chanson() {{
        id = 138;
        titre = "Christian Löffler";
    }}, new Chanson() {{
        id = 139;
        titre = "Christophe";
    }}, new Chanson() {{
        id = 140;
        titre = "Chuck Berry";
    }}, new Chanson() {{
        id = 141;
        titre = "Cigarettes After Sex";
    }}, new Chanson() {{
        id = 142;
        titre = "Claude Gauthier";
    }}, new Chanson() {{
        id = 143;
        titre = "Claude Leveille";
    }}, new Chanson() {{
        id = 144;
        titre = "Clement Bazin";
    }}, new Chanson() {{
        id = 145;
        titre = "Club cheval";
    }}, new Chanson() {{
        id = 146;
        titre = "Coldplay";
    }}, new Chanson() {{
        id = 147;
        titre = "Connor Price";
    }}, new Chanson() {{
        id = 148;
        titre = "Crayon";
    }}, new Chanson() {{
        id = 149;
        titre = "Crystal";
    }}, new Chanson() {{
        id = 150;
        titre = "Cynthia Erivo";
    }}, new Chanson() {{
        id = 151;
        titre = "Céline Dion";
    }}, new Chanson() {{
        id = 152;
        titre = "Coeur De Pirate";
    }}, new Chanson() {{
        id = 153;
        titre = "DJ BORING";
    }}, new Chanson() {{
        id = 154;
        titre = "DJ Snake";
    }}, new Chanson() {{
        id = 155;
        titre = "DJ Traytex";
    }}, new Chanson() {{
        id = 156;
        titre = "Dabeull";
    }}, new Chanson() {{
        id = 157;
        titre = "Daddy Jean";
    }}, new Chanson() {{
        id = 158;
        titre = "Daddy Yankee";
    }}, new Chanson() {{
        id = 159;
        titre = "Dadju";
    }}, new Chanson() {{
        id = 160;
        titre = "Dallas Francis";
    }}, new Chanson() {{
        id = 161;
        titre = "Damien Robitaille";
    }}, new Chanson() {{
        id = 162;
        titre = "Damso";
    }}, new Chanson() {{
        id = 163;
        titre = "Danakil";
    }}, new Chanson() {{
        id = 164;
        titre = "Daniel Balavoine";
    }}, new Chanson() {{
        id = 165;
        titre = "Daniel Boucher";
    }}, new Chanson() {{
        id = 166;
        titre = "Daniel Bélanger";
    }}, new Chanson() {{
        id = 167;
        titre = "Darell";
    }}, new Chanson() {{
        id = 168;
        titre = "Darius";
    }}, new Chanson() {{
        id = 169;
        titre = "Darondo";
    }}, new Chanson() {{
        id = 170;
        titre = "David Bowie";
    }}, new Chanson() {{
        id = 171;
        titre = "David Guetta";
    }}, new Chanson() {{
        id = 172;
        titre = "David Otero";
    }}, new Chanson() {{
        id = 173;
        titre = "De Temps Antan";
    }}, new Chanson() {{
        id = 174;
        titre = "Dead Obies";
    }}, new Chanson() {{
        id = 175;
        titre = "Dean Martin";
    }}, new Chanson() {{
        id = 176;
        titre = "Dee Eye";
    }}, new Chanson() {{
        id = 177;
        titre = "Dekker";
    }}, new Chanson() {{
        id = 178;
        titre = "Demon";
    }}, new Chanson() {{
        id = 179;
        titre = "Denis Frechette";
    }}, new Chanson() {{
        id = 180;
        titre = "Dennis Wilson";
    }}, new Chanson() {{
        id = 181;
        titre = "Depeche Mode";
    }}, new Chanson() {{
        id = 182;
        titre = "Derek Bell";
    }}, new Chanson() {{
        id = 183;
        titre = "Dermot Kennedy";
    }}, new Chanson() {{
        id = 184;
        titre = "Desireless";
    }}, new Chanson() {{
        id = 185;
        titre = "Devochka";
    }}, new Chanson() {{
        id = 186;
        titre = "Dick Dale & His Del-Tones";
    }}, new Chanson() {{
        id = 187;
        titre = "Dire Straits";
    }}, new Chanson() {{
        id = 188;
        titre = "Django Reinhardt";
    }}, new Chanson() {{
        id = 189;
        titre = "Doja Cat";
    }}, new Chanson() {{
        id = 190;
        titre = "Dominique Michel";
    }}, new Chanson() {{
        id = 191;
        titre = "Don Toliver";
    }}, new Chanson() {{
        id = 192;
        titre = "Donovan";
    }}, new Chanson() {{
        id = 193;
        titre = "Doums";
    }}, new Chanson() {{
        id = 194;
        titre = "Drake";
    }}, new Chanson() {{
        id = 195;
        titre = "Drew";
    }}, new Chanson() {{
        id = 196;
        titre = "Dua Lipa";
    }}, new Chanson() {{
        id = 197;
        titre = "Duffy";
    }}, new Chanson() {{
        id = 198;
        titre = "Dusin";
    }}, new Chanson() {{
        id = 199;
        titre = "Dusty Springfield";
    }}, new Chanson() {{
        id = 200;
        titre = "EKKSTACY";
    }}, new Chanson() {{
        id = 201;
        titre = "Edmofo";
    }}, new Chanson() {{
        id = 202;
        titre = "Edward Sharpe & The Magnetic Zeros";
    }}, new Chanson() {{
        id = 203;
        titre = "Efy Hecks";
    }}, new Chanson() {{
        id = 204;
        titre = "Ehla";
    }}, new Chanson() {{
        id = 205;
        titre = "Elephant Talk";
    }}, new Chanson() {{
        id = 206;
        titre = "Elephanz";
    }}, new Chanson() {{
        id = 207;
        titre = "Eliza Rose";
    }}, new Chanson() {{
        id = 208;
        titre = "Elle Valenci";
    }}, new Chanson() {{
        id = 209;
        titre = "Elton John";
    }}, new Chanson() {{
        id = 210;
        titre = "Elvis Presley";
    }}, new Chanson() {{
        id = 211;
        titre = "Emma Peters";
    }}, new Chanson() {{
        id = 212;
        titre = "Emmanuel Moire";
    }}, new Chanson() {{
        id = 213;
        titre = "Empire of the Sun";
    }}, new Chanson() {{
        id = 214;
        titre = "Enrique Iglesias";
    }}, new Chanson() {{
        id = 215;
        titre = "Eric Prydz";
    }}, new Chanson() {{
        id = 216;
        titre = "Estopa";
    }}, new Chanson() {{
        id = 217;
        titre = "FILV";
    }}, new Chanson() {{
        id = 218;
        titre = "FKJ";
    }}, new Chanson() {{
        id = 219;
        titre = "FOOL";
    }}, new Chanson() {{
        id = 220;
        titre = "Faces on TV";
    }}, new Chanson() {{
        id = 221;
        titre = "Famille Demers";
    }}, new Chanson() {{
        id = 222;
        titre = "Faudel";
    }}, new Chanson() {{
        id = 223;
        titre = "Fave";
    }}, new Chanson() {{
        id = 224;
        titre = "Felix Leclerc";
    }}, new Chanson() {{
        id = 225;
        titre = "Felixita";
    }}, new Chanson() {{
        id = 226;
        titre = "Feu! Chatterton";
    }}, new Chanson() {{
        id = 227;
        titre = "Fever Ray";
    }}, new Chanson() {{
        id = 228;
        titre = "Fleetwood Mac";
    }}, new Chanson() {{
        id = 229;
        titre = "Foster The People";
    }}, new Chanson() {{
        id = 230;
        titre = "France Gall";
    }}, new Chanson() {{
        id = 231;
        titre = "Frank Ocean";
    }}, new Chanson() {{
        id = 232;
        titre = "Frank Zappa";
    }}, new Chanson() {{
        id = 233;
        titre = "Franky Fade";
    }}, new Chanson() {{
        id = 234;
        titre = "Françoise Hardy";
    }}, new Chanson() {{
        id = 235;
        titre = "Fred again..";
    }}, new Chanson() {{
        id = 236;
        titre = "French 79";
    }}, new Chanson() {{
        id = 237;
        titre = "Funk Wav";
    }}, new Chanson() {{
        id = 238;
        titre = "Funkadelic";
    }}, new Chanson() {{
        id = 239;
        titre = "Future";
    }}, new Chanson() {{
        id = 240;
        titre = "Gab Bouchard";
    }}, new Chanson() {{
        id = 241;
        titre = "Gabriella Cilmi";
    }}, new Chanson() {{
        id = 242;
        titre = "Gala";
    }}, new Chanson() {{
        id = 243;
        titre = "Galant tu perds ton temps";
    }}, new Chanson() {{
        id = 244;
        titre = "Garou";
    }}, new Chanson() {{
        id = 245;
        titre = "Gaël Faye";
    }}, new Chanson() {{
        id = 246;
        titre = "George Baker Selection";
    }}, new Chanson() {{
        id = 247;
        titre = "Georges Brassens";
    }}, new Chanson() {{
        id = 248;
        titre = "Georges Moustaki";
    }}, new Chanson() {{
        id = 249;
        titre = "Georgio";
    }}, new Chanson() {{
        id = 250;
        titre = "Germaine Dugas";
    }}, new Chanson() {{
        id = 251;
        titre = "Gilbert O'Sullivan";
    }}, new Chanson() {{
        id = 252;
        titre = "Gilles Vigneault";
    }}, new Chanson() {{
        id = 253;
        titre = "Giolì & Assia";
    }}, new Chanson() {{
        id = 254;
        titre = "Girls In Hawaii";
    }}, new Chanson() {{
        id = 255;
        titre = "Gloria Gaynor";
    }}, new Chanson() {{
        id = 256;
        titre = "Gnarls Barkley";
    }}, new Chanson() {{
        id = 257;
        titre = "Gordon Tracks";
    }}, new Chanson() {{
        id = 258;
        titre = "Gotts Street Park";
    }}, new Chanson() {{
        id = 259;
        titre = "Grace Carter";
    }}, new Chanson() {{
        id = 260;
        titre = "Gracie Abrams";
    }}, new Chanson() {{
        id = 261;
        titre = "Graham Nash";
    }}, new Chanson() {{
        id = 262;
        titre = "Guantanamo Baywatch";
    }}, new Chanson() {{
        id = 263;
        titre = "Gus Black";
    }}, new Chanson() {{
        id = 264;
        titre = "Gwen Stefani";
    }}, new Chanson() {{
        id = 265;
        titre = "Gérard Calvi";
    }}, new Chanson() {{
        id = 266;
        titre = "HONNE";
    }}, new Chanson() {{
        id = 267;
        titre = "Hamid Al Shaeri";
    }}, new Chanson() {{
        id = 268;
        titre = "Hansom Ēli";
    }}, new Chanson() {{
        id = 269;
        titre = "Harmonium";
    }}, new Chanson() {{
        id = 270;
        titre = "Harry Nilsson";
    }}, new Chanson() {{
        id = 271;
        titre = "Harry Styles";
    }}, new Chanson() {{
        id = 272;
        titre = "Hatik";
    }}, new Chanson() {{
        id = 273;
        titre = "Her";
    }}, new Chanson() {{
        id = 274;
        titre = "Hombres G";
    }}, new Chanson() {{
        id = 275;
        titre = "Hotel Ugly";
    }}, new Chanson() {{
        id = 276;
        titre = "Hozier";
    }}, new Chanson() {{
        id = 277;
        titre = "Hubert Lenoir";
    }}, new Chanson() {{
        id = 278;
        titre = "Hurlevent";
    }}, new Chanson() {{
        id = 279;
        titre = "Hyper Go Go";
    }}, new Chanson() {{
        id = 280;
        titre = "Hélène Baillargeon";
    }}, new Chanson() {{
        id = 281;
        titre = "Iggy Pop";
    }}, new Chanson() {{
        id = 282;
        titre = "Interplanetary Criminal";
    }}, new Chanson() {{
        id = 283;
        titre = "Isaac Delusion";
    }}, new Chanson() {{
        id = 284;
        titre = "Isabelle Boulay";
    }}, new Chanson() {{
        id = 285;
        titre = "Isabelle Pierre";
    }}, new Chanson() {{
        id = 286;
        titre = "J Balvin";
    }}, new Chanson() {{
        id = 287;
        titre = "J.J. Cale";
    }}, new Chanson() {{
        id = 288;
        titre = "JP « Le Pad » Tremblay";
    }}, new Chanson() {{
        id = 289;
        titre = "JVKE";
    }}, new Chanson() {{
        id = 290;
        titre = "Jack Harlow";
    }}, new Chanson() {{
        id = 291;
        titre = "Jacob Banks";
    }}, new Chanson() {{
        id = 292;
        titre = "Jacob Miller";
    }}, new Chanson() {{
        id = 293;
        titre = "Jacqueline Taieb";
    }}, new Chanson() {{
        id = 294;
        titre = "Jacques Balutin";
    }}, new Chanson() {{
        id = 295;
        titre = "Jacques Blanchet";
    }}, new Chanson() {{
        id = 296;
        titre = "Jacques Brel";
    }}, new Chanson() {{
        id = 297;
        titre = "Jacques Dutronc";
    }}, new Chanson() {{
        id = 298;
        titre = "Jacques Normand";
    }}, new Chanson() {{
        id = 299;
        titre = "Jake Bugg";
    }}, new Chanson() {{
        id = 300;
        titre = "James Blake";
    }}, new Chanson() {{
        id = 301;
        titre = "James Last";
    }}, new Chanson() {{
        id = 302;
        titre = "James Morrison";
    }}, new Chanson() {{
        id = 303;
        titre = "James Taylor";
    }}, new Chanson() {{
        id = 304;
        titre = "Jamie xx";
    }}, new Chanson() {{
        id = 305;
        titre = "Jane Birkin";
    }}, new Chanson() {{
        id = 306;
        titre = "Janis Joplin";
    }}, new Chanson() {{
        id = 307;
        titre = "Jazzy Bazz";
    }}, new Chanson() {{
        id = 308;
        titre = "Jean Dujardin";
    }}, new Chanson() {{
        id = 309;
        titre = "Jean Fréchette";
    }}, new Chanson() {{
        id = 310;
        titre = "Jean Leclerc";
    }}, new Chanson() {{
        id = 311;
        titre = "Jean Leloup";
    }}, new Chanson() {{
        id = 312;
        titre = "Jean-Pierre Ferland";
    }}, new Chanson() {{
        id = 313;
        titre = "Jeff Beck";
    }}, new Chanson() {{
        id = 314;
        titre = "Jeff Buckley";
    }}, new Chanson() {{
        id = 315;
        titre = "Jefferson Airplane";
    }}, new Chanson() {{
        id = 316;
        titre = "Jerry Reed";
    }}, new Chanson() {{
        id = 317;
        titre = "Jess Glynne";
    }}, new Chanson() {{
        id = 318;
        titre = "Jesse Mac Cormack";
    }}, new Chanson() {{
        id = 319;
        titre = "Jethro Tull";
    }}, new Chanson() {{
        id = 320;
        titre = "Jhayco";
    }}, new Chanson() {{
        id = 321;
        titre = "Jim Corcoran";
    }}, new Chanson() {{
        id = 322;
        titre = "Jocelyn Lapointe";
    }}, new Chanson() {{
        id = 323;
        titre = "Joe Dassin";
    }}, new Chanson() {{
        id = 324;
        titre = "Joe Hisaishi";
    }}, new Chanson() {{
        id = 325;
        titre = "Joey Bada$$";
    }}, new Chanson() {{
        id = 326;
        titre = "John Arcand";
    }}, new Chanson() {{
        id = 327;
        titre = "John Cale";
    }}, new Chanson() {{
        id = 328;
        titre = "John Coltrane";
    }}, new Chanson() {{
        id = 329;
        titre = "John Lennon";
    }}, new Chanson() {{
        id = 330;
        titre = "Johnny Cash";
    }}, new Chanson() {{
        id = 331;
        titre = "Joji";
    }}, new Chanson() {{
        id = 332;
        titre = "Jok'air";
    }}, new Chanson() {{
        id = 333;
        titre = "Jon Bellion";
    }}, new Chanson() {{
        id = 334;
        titre = "Jorge Ben Jor";
    }}, new Chanson() {{
        id = 335;
        titre = "Josman";
    }}, new Chanson() {{
        id = 336;
        titre = "José Feliciano";
    }}, new Chanson() {{
        id = 337;
        titre = "Journey";
    }}, new Chanson() {{
        id = 338;
        titre = "Juanes";
    }}, new Chanson() {{
        id = 339;
        titre = "Juca Chaves";
    }}, new Chanson() {{
        id = 340;
        titre = "Julia Minkin";
    }}, new Chanson() {{
        id = 341;
        titre = "Juliette Armanet";
    }}, new Chanson() {{
        id = 342;
        titre = "Juls";
    }}, new Chanson() {{
        id = 343;
        titre = "Jungle";
    }}, new Chanson() {{
        id = 344;
        titre = "Junkie XL";
    }}, new Chanson() {{
        id = 345;
        titre = "Justin Timberlake";
    }}, new Chanson() {{
        id = 346;
        titre = "Jérôme 50";
    }}, new Chanson() {{
        id = 347;
        titre = "K.Maro";
    }}, new Chanson() {{
        id = 348;
        titre = "KAROL G";
    }}, new Chanson() {{
        id = 349;
        titre = "KT Tunstall";
    }}, new Chanson() {{
        id = 350;
        titre = "Kadebostany";
    }}, new Chanson() {{
        id = 351;
        titre = "Kalash";
    }}, new Chanson() {{
        id = 352;
        titre = "Karsu";
    }}, new Chanson() {{
        id = 353;
        titre = "Kate Bush";
    }}, new Chanson() {{
        id = 354;
        titre = "Kate Ryan";
    }}, new Chanson() {{
        id = 355;
        titre = "Kazy Lambist";
    }}, new Chanson() {{
        id = 356;
        titre = "Kenny Rogers & The First Edition";
    }}, new Chanson() {{
        id = 357;
        titre = "Kevin Conneff";
    }}, new Chanson() {{
        id = 358;
        titre = "Khaled";
    }}, new Chanson() {{
        id = 359;
        titre = "Khamari";
    }}, new Chanson() {{
        id = 360;
        titre = "Kid Francescoli";
    }}, new Chanson() {{
        id = 361;
        titre = "Kidnap";
    }}, new Chanson() {{
        id = 362;
        titre = "Killa";
    }}, new Chanson() {{
        id = 363;
        titre = "Kim Petras";
    }}, new Chanson() {{
        id = 364;
        titre = "King Crimson";
    }}, new Chanson() {{
        id = 365;
        titre = "Klangkarussell";
    }}, new Chanson() {{
        id = 366;
        titre = "Klyne";
    }}, new Chanson() {{
        id = 367;
        titre = "Klô Pelgag";
    }}, new Chanson() {{
        id = 368;
        titre = "Koffee";
    }}, new Chanson() {{
        id = 369;
        titre = "Kolter";
    }}, new Chanson() {{
        id = 370;
        titre = "Kool & The Gang";
    }}, new Chanson() {{
        id = 371;
        titre = "Kun Agüero";
    }}, new Chanson() {{
        id = 372;
        titre = "Kygo";
    }}, new Chanson() {{
        id = 373;
        titre = "LADIPOE";
    }}, new Chanson() {{
        id = 374;
        titre = "LAUSSE THE CAT";
    }}, new Chanson() {{
        id = 375;
        titre = "LC Elo";
    }}, new Chanson() {{
        id = 376;
        titre = "La Bolduc";
    }}, new Chanson() {{
        id = 377;
        titre = "La Bottine Souriante";
    }}, new Chanson() {{
        id = 378;
        titre = "La Fine Equipe";
    }}, new Chanson() {{
        id = 379;
        titre = "La Mala";
    }}, new Chanson() {{
        id = 380;
        titre = "La Oreja de Van Gogh";
    }}, new Chanson() {{
        id = 381;
        titre = "La Tuque Bleue";
    }}, new Chanson() {{
        id = 382;
        titre = "La Volée d'Castors";
    }}, new Chanson() {{
        id = 383;
        titre = "La Yegros";
    }}, new Chanson() {{
        id = 384;
        titre = "La famille Soucy";
    }}, new Chanson() {{
        id = 385;
        titre = "Lana Del Rey";
    }}, new Chanson() {{
        id = 386;
        titre = "Le Bal À L’Huile";
    }}, new Chanson() {{
        id = 387;
        titre = "Le RÊve Du Diable";
    }}, new Chanson() {{
        id = 388;
        titre = "Lecomte De Brégeot";
    }}, new Chanson() {{
        id = 389;
        titre = "Led Zeppelin";
    }}, new Chanson() {{
        id = 390;
        titre = "Lee Hazlewood";
    }}, new Chanson() {{
        id = 391;
        titre = "Leonard Cohen";
    }}, new Chanson() {{
        id = 392;
        titre = "Les Batteux-Slaques";
    }}, new Chanson() {{
        id = 393;
        titre = "Les Charbonniers De L'enfer";
    }}, new Chanson() {{
        id = 394;
        titre = "Les Chauffeurs À Pieds";
    }}, new Chanson() {{
        id = 395;
        titre = "Les Choeurs de l'Armée Rouge";
    }}, new Chanson() {{
        id = 396;
        titre = "Les Colocs";
    }}, new Chanson() {{
        id = 397;
        titre = "Les Cowboys Fringants";
    }}, new Chanson() {{
        id = 398;
        titre = "Les Cuillères à Carreaux";
    }}, new Chanson() {{
        id = 399;
        titre = "Les Deuxluxes";
    }}, new Chanson() {{
        id = 400;
        titre = "Les Frères Lemay";
    }}, new Chanson() {{
        id = 401;
        titre = "Les Gordon";
    }}, new Chanson() {{
        id = 402;
        titre = "Les Grands Hurleurs";
    }}, new Chanson() {{
        id = 403;
        titre = "Les Hay Babies";
    }}, new Chanson() {{
        id = 404;
        titre = "Les Poppys";
    }}, new Chanson() {{
        id = 405;
        titre = "Les Poules à Colin";
    }}, new Chanson() {{
        id = 406;
        titre = "Les Rats d'Swompe";
    }}, new Chanson() {{
        id = 407;
        titre = "Les Tireux d'Roches";
    }}, new Chanson() {{
        id = 408;
        titre = "Les Trois Accords";
    }}, new Chanson() {{
        id = 409;
        titre = "Lil Nas X";
    }}, new Chanson() {{
        id = 410;
        titre = "Linda McCartney";
    }}, new Chanson() {{
        id = 411;
        titre = "Link Wray";
    }}, new Chanson() {{
        id = 412;
        titre = "Lisa LeBlanc";
    }}, new Chanson() {{
        id = 413;
        titre = "Lithium";
    }}, new Chanson() {{
        id = 414;
        titre = "Loona";
    }}, new Chanson() {{
        id = 415;
        titre = "Lord Esperanza";
    }}, new Chanson() {{
        id = 416;
        titre = "Lorn";
    }}, new Chanson() {{
        id = 417;
        titre = "Lossapardo";
    }}, new Chanson() {{
        id = 418;
        titre = "Lou Reed";
    }}, new Chanson() {{
        id = 419;
        titre = "Loud";
    }}, new Chanson() {{
        id = 420;
        titre = "Louis Prima";
    }}, new Chanson() {{
        id = 421;
        titre = "Louise Attaque";
    }}, new Chanson() {{
        id = 422;
        titre = "Louise Forestier";
    }}, new Chanson() {{
        id = 423;
        titre = "Louisette";
    }}, new Chanson() {{
        id = 424;
        titre = "Louisette & Amaury";
    }}, new Chanson() {{
        id = 425;
        titre = "Lous and The Yakuza";
    }}, new Chanson() {{
        id = 426;
        titre = "Loyle Carner";
    }}, new Chanson() {{
        id = 427;
        titre = "Lucien Boyer";
    }}, new Chanson() {{
        id = 428;
        titre = "Lucy Rose";
    }}, new Chanson() {{
        id = 429;
        titre = "Luidji";
    }}, new Chanson() {{
        id = 430;
        titre = "Luis Enrique";
    }}, new Chanson() {{
        id = 431;
        titre = "Lykke Li";
    }}, new Chanson() {{
        id = 432;
        titre = "M.I.A.";
    }}, new Chanson() {{
        id = 433;
        titre = "M83";
    }}, new Chanson() {{
        id = 434;
        titre = "MARO";
    }}, new Chanson() {{
        id = 435;
        titre = "MAVI";
    }}, new Chanson() {{
        id = 436;
        titre = "MAYKO";
    }}, new Chanson() {{
        id = 437;
        titre = "MGMT";
    }}, new Chanson() {{
        id = 438;
        titre = "MONTMARTRE";
    }}, new Chanson() {{
        id = 439;
        titre = "MRD";
    }}, new Chanson() {{
        id = 440;
        titre = "Macaco";
    }}, new Chanson() {{
        id = 441;
        titre = "MadeInParis";
    }}, new Chanson() {{
        id = 442;
        titre = "Malajube";
    }}, new Chanson() {{
        id = 443;
        titre = "Maluma";
    }}, new Chanson() {{
        id = 444;
        titre = "Mandragora";
    }}, new Chanson() {{
        id = 445;
        titre = "Manon Bédard";
    }}, new Chanson() {{
        id = 446;
        titre = "Manouche";
    }}, new Chanson() {{
        id = 447;
        titre = "Manu Chao";
    }}, new Chanson() {{
        id = 448;
        titre = "Marbert Rocel";
    }}, new Chanson() {{
        id = 449;
        titre = "Marc Gelinas";
    }}, new Chanson() {{
        id = 450;
        titre = "Marc Hervieux";
    }}, new Chanson() {{
        id = 451;
        titre = "Marc Vaillancourt";
    }}, new Chanson() {{
        id = 452;
        titre = "Marie Laforêt";
    }}, new Chanson() {{
        id = 453;
        titre = "Marta Sánchez";
    }}, new Chanson() {{
        id = 454;
        titre = "Marthe Fleurant";
    }}, new Chanson() {{
        id = 455;
        titre = "Martin Fay";
    }}, new Chanson() {{
        id = 456;
        titre = "Mary J. Blige";
    }}, new Chanson() {{
        id = 457;
        titre = "Matina Sous Peau";
    }}, new Chanson() {{
        id = 458;
        titre = "Matt Molloy";
    }}, new Chanson() {{
        id = 459;
        titre = "Matt Naylor";
    }}, new Chanson() {{
        id = 460;
        titre = "Mauvais Sort";
    }}, new Chanson() {{
        id = 461;
        titre = "Mc Pedrinho";
    }}, new Chanson() {{
        id = 462;
        titre = "McKinley Dixon";
    }}, new Chanson() {{
        id = 463;
        titre = "Meg Mac";
    }}, new Chanson() {{
        id = 464;
        titre = "Mega";
    }}, new Chanson() {{
        id = 465;
        titre = "Melanie Martinez";
    }}, new Chanson() {{
        id = 466;
        titre = "Mella Dee";
    }}, new Chanson() {{
        id = 467;
        titre = "Menke";
    }}, new Chanson() {{
        id = 468;
        titre = "Merce";
    }}, new Chanson() {{
        id = 469;
        titre = "Mes Aïeux";
    }}, new Chanson() {{
        id = 470;
        titre = "Method Man";
    }}, new Chanson() {{
        id = 471;
        titre = "Michael Kiwanuka";
    }}, new Chanson() {{
        id = 472;
        titre = "Michel Bordeleau";
    }}, new Chanson() {{
        id = 473;
        titre = "Michel Fugain & Le Big Bazar";
    }}, new Chanson() {{
        id = 474;
        titre = "Miguel Bosé";
    }}, new Chanson() {{
        id = 475;
        titre = "Mild High Club";
    }}, new Chanson() {{
        id = 476;
        titre = "Milky Chance";
    }}, new Chanson() {{
        id = 477;
        titre = "Milow";
    }}, new Chanson() {{
        id = 478;
        titre = "Milt Jackson";
    }}, new Chanson() {{
        id = 479;
        titre = "Misfit.K";
    }}, new Chanson() {{
        id = 480;
        titre = "Model Man";
    }}, new Chanson() {{
        id = 481;
        titre = "Mohombi";
    }}, new Chanson() {{
        id = 482;
        titre = "Monique Miville-Deschênes";
    }}, new Chanson() {{
        id = 483;
        titre = "Monsieur Pointu";
    }}, new Chanson() {{
        id = 484;
        titre = "Mooglie";
    }}, new Chanson() {{
        id = 485;
        titre = "Morad";
    }}, new Chanson() {{
        id = 486;
        titre = "Morgan Delt";
    }}, new Chanson() {{
        id = 487;
        titre = "Moriarty";
    }}, new Chanson() {{
        id = 488;
        titre = "Mose Allison";
    }}, new Chanson() {{
        id = 489;
        titre = "Mouffe";
    }}, new Chanson() {{
        id = 490;
        titre = "Multi-interprètes";
    }}, new Chanson() {{
        id = 491;
        titre = "Murray Head";
    }}, new Chanson() {{
        id = 492;
        titre = "Muse";
    }}, new Chanson() {{
        id = 493;
        titre = "Musique à bouches";
    }}, new Chanson() {{
        id = 494;
        titre = "Møme";
    }}, new Chanson() {{
        id = 495;
        titre = "NOEMIE";
    }}, new Chanson() {{
        id = 496;
        titre = "NTO";
    }}, new Chanson() {{
        id = 497;
        titre = "Najwa";
    }}, new Chanson() {{
        id = 498;
        titre = "Nancy Sinatra";
    }}, new Chanson() {{
        id = 499;
        titre = "Nanette Workman";
    }}, new Chanson() {{
        id = 500;
        titre = "Naza";
    }}, new Chanson() {{
        id = 501;
        titre = "Nekfeu";
    }}, new Chanson() {{
        id = 502;
        titre = "Nelly Furtado";
    }}, new Chanson() {{
        id = 503;
        titre = "Never Get Used To People";
    }}, new Chanson() {{
        id = 504;
        titre = "Nick Drake";
    }}, new Chanson() {{
        id = 505;
        titre = "Nickodemus";
    }}, new Chanson() {{
        id = 506;
        titre = "Nicky Jam";
    }}, new Chanson() {{
        id = 507;
        titre = "Nicolas Pellerin";
    }}, new Chanson() {{
        id = 508;
        titre = "Nicolas Pellerin et les Grands Hurleurs";
    }}, new Chanson() {{
        id = 509;
        titre = "Nilüfer Yanya";
    }}, new Chanson() {{
        id = 510;
        titre = "Nino Ferrer";
    }}, new Chanson() {{
        id = 511;
        titre = "Nio Garcia";
    }}, new Chanson() {{
        id = 512;
        titre = "Niro";
    }}, new Chanson() {{
        id = 513;
        titre = "Nirvana";
    }}, new Chanson() {{
        id = 514;
        titre = "No Good";
    }}, new Chanson() {{
        id = 515;
        titre = "OBK";
    }}, new Chanson() {{
        id = 516;
        titre = "OBOY";
    }}, new Chanson() {{
        id = 517;
        titre = "Octavian";
    }}, new Chanson() {{
        id = 518;
        titre = "Offenbach";
    }}, new Chanson() {{
        id = 519;
        titre = "Okou";
    }}, new Chanson() {{
        id = 520;
        titre = "Oliver Tree";
    }}, new Chanson() {{
        id = 521;
        titre = "Olympe Chabert";
    }}, new Chanson() {{
        id = 522;
        titre = "Omar Apollo";
    }}, new Chanson() {{
        id = 523;
        titre = "Ona Mafalda";
    }}, new Chanson() {{
        id = 524;
        titre = "Orchestral Manoeuvres In The Dark";
    }}, new Chanson() {{
        id = 525;
        titre = "Orchestre Symphonique De Québec";
    }}, new Chanson() {{
        id = 526;
        titre = "Oscar Anton";
    }}, new Chanson() {{
        id = 527;
        titre = "Oscar Emch";
    }}, new Chanson() {{
        id = 528;
        titre = "Oscar Thiffault";
    }}, new Chanson() {{
        id = 529;
        titre = "Ovila Légaré";
    }}, new Chanson() {{
        id = 530;
        titre = "Owlle";
    }}, new Chanson() {{
        id = 531;
        titre = "Ozuna";
    }}, new Chanson() {{
        id = 532;
        titre = "P'tit Belliveau";
    }}, new Chanson() {{
        id = 533;
        titre = "PEDRO SAMPAIO";
    }}, new Chanson() {{
        id = 534;
        titre = "Paddy Moloney";
    }}, new Chanson() {{
        id = 535;
        titre = "Papooz";
    }}, new Chanson() {{
        id = 536;
        titre = "Parov Stelar";
    }}, new Chanson() {{
        id = 537;
        titre = "Partenaire Particulier";
    }}, new Chanson() {{
        id = 538;
        titre = "Pascal Letoublon";
    }}, new Chanson() {{
        id = 539;
        titre = "Patrick Watson";
    }}, new Chanson() {{
        id = 540;
        titre = "Patsy Cline";
    }}, new Chanson() {{
        id = 541;
        titre = "Paul McCartney";
    }}, new Chanson() {{
        id = 542;
        titre = "Paul Piché";
    }}, new Chanson() {{
        id = 543;
        titre = "Paul Simon";
    }}, new Chanson() {{
        id = 544;
        titre = "PaulWetz";
    }}, new Chanson() {{
        id = 545;
        titre = "Pauline Julien";
    }}, new Chanson() {{
        id = 546;
        titre = "Peach Pit";
    }}, new Chanson() {{
        id = 547;
        titre = "Peggy Gou";
    }}, new Chanson() {{
        id = 548;
        titre = "Phil Harris";
    }}, new Chanson() {{
        id = 549;
        titre = "Philippe Chatel";
    }}, new Chanson() {{
        id = 550;
        titre = "Phoebe Killdeer";
    }}, new Chanson() {{
        id = 551;
        titre = "Phoenix";
    }}, new Chanson() {{
        id = 552;
        titre = "Pier Béland";
    }}, new Chanson() {{
        id = 553;
        titre = "Pierre Daignault";
    }}, new Chanson() {{
        id = 554;
        titre = "Pierre Lapointe";
    }}, new Chanson() {{
        id = 555;
        titre = "Pierre de Maere";
    }}, new Chanson() {{
        id = 556;
        titre = "Pink Floyd";
    }}, new Chanson() {{
        id = 557;
        titre = "Pino D'Angiò";
    }}, new Chanson() {{
        id = 558;
        titre = "Pixies";
    }}, new Chanson() {{
        id = 559;
        titre = "Plastic Bertrand";
    }}, new Chanson() {{
        id = 560;
        titre = "Plume Latraverse";
    }}, new Chanson() {{
        id = 561;
        titre = "Pomme";
    }}, new Chanson() {{
        id = 562;
        titre = "Pongo";
    }}, new Chanson() {{
        id = 563;
        titre = "Portugal. The Man";
    }}, new Chanson() {{
        id = 564;
        titre = "Prince Waly";
    }}, new Chanson() {{
        id = 565;
        titre = "Prof. Lacasse";
    }}, new Chanson() {{
        id = 566;
        titre = "Purple Disco Machine";
    }}, new Chanson() {{
        id = 567;
        titre = "Pépite";
    }}, new Chanson() {{
        id = 568;
        titre = "Pérez Prado";
    }}, new Chanson() {{
        id = 569;
        titre = "Quintette du Hot Club de France";
    }}, new Chanson() {{
        id = 570;
        titre = "Québec Redneck Bluegrass Project";
    }}, new Chanson() {{
        id = 571;
        titre = "R.E.M.";
    }}, new Chanson() {{
        id = 572;
        titre = "RAUMM";
    }}, new Chanson() {{
        id = 573;
        titre = "ROSALÍA";
    }}, new Chanson() {{
        id = 574;
        titre = "RY X";
    }}, new Chanson() {{
        id = 575;
        titre = "Rachid Taha";
    }}, new Chanson() {{
        id = 576;
        titre = "Radiohead";
    }}, new Chanson() {{
        id = 577;
        titre = "Ragoût";
    }}, new Chanson() {{
        id = 578;
        titre = "Ray Charles";
    }}, new Chanson() {{
        id = 579;
        titre = "Raymond Levesque";
    }}, new Chanson() {{
        id = 580;
        titre = "Rednex";
    }}, new Chanson() {{
        id = 581;
        titre = "Regard";
    }}, new Chanson() {{
        id = 582;
        titre = "Regent Archambault";
    }}, new Chanson() {{
        id = 583;
        titre = "Rema";
    }}, new Chanson() {{
        id = 584;
        titre = "Renaud";
    }}, new Chanson() {{
        id = 585;
        titre = "Renée Claude";
    }}, new Chanson() {{
        id = 586;
        titre = "Rich Brian";
    }}, new Chanson() {{
        id = 587;
        titre = "Rihanna";
    }}, new Chanson() {{
        id = 588;
        titre = "Rilès";
    }}, new Chanson() {{
        id = 589;
        titre = "Robert Charlebois";
    }}, new Chanson() {{
        id = 590;
        titre = "Robert Ellis";
    }}, new Chanson() {{
        id = 591;
        titre = "Roberto Roena Y Su Apollo Sound";
    }}, new Chanson() {{
        id = 592;
        titre = "Robin Schulz";
    }}, new Chanson() {{
        id = 593;
        titre = "Rodríguez";
    }}, new Chanson() {{
        id = 594;
        titre = "Roger Miron";
    }}, new Chanson() {{
        id = 595;
        titre = "Roméo Elvis";
    }}, new Chanson() {{
        id = 596;
        titre = "Route 94";
    }}, new Chanson() {{
        id = 597;
        titre = "Roy Haynes Quartet";
    }}, new Chanson() {{
        id = 598;
        titre = "Rucci";
    }}, new Chanson() {{
        id = 599;
        titre = "SYML";
    }}, new Chanson() {{
        id = 600;
        titre = "SZA";
    }}, new Chanson() {{
        id = 601;
        titre = "Sam Smith";
    }}, new Chanson() {{
        id = 602;
        titre = "Samantha Martin & Delta Sugar";
    }}, new Chanson() {{
        id = 603;
        titre = "Samia";
    }}, new Chanson() {{
        id = 604;
        titre = "Samm Henshaw";
    }}, new Chanson() {{
        id = 605;
        titre = "Sampha";
    }}, new Chanson() {{
        id = 606;
        titre = "Samuel T. Herring";
    }}, new Chanson() {{
        id = 607;
        titre = "Sandra Carrasco";
    }}, new Chanson() {{
        id = 608;
        titre = "Santana";
    }}, new Chanson() {{
        id = 609;
        titre = "Sara Dufour";
    }}, new Chanson() {{
        id = 610;
        titre = "Sarah McLachlan";
    }}, new Chanson() {{
        id = 611;
        titre = "Scylla";
    }}, new Chanson() {{
        id = 612;
        titre = "Sean Paul";
    }}, new Chanson() {{
        id = 613;
        titre = "SebastiAn";
    }}, new Chanson() {{
        id = 614;
        titre = "Serge Gainsbourg";
    }}, new Chanson() {{
        id = 615;
        titre = "Sex Pistols";
    }}, new Chanson() {{
        id = 616;
        titre = "Seán Keane";
    }}, new Chanson() {{
        id = 617;
        titre = "Shakira";
    }}, new Chanson() {{
        id = 618;
        titre = "Shirazee";
    }}, new Chanson() {{
        id = 619;
        titre = "Silk Sonic";
    }}, new Chanson() {{
        id = 620;
        titre = "Silly Boy Blue";
    }}, new Chanson() {{
        id = 621;
        titre = "Simon & Garfunkel";
    }}, new Chanson() {{
        id = 622;
        titre = "Skiifall";
    }}, new Chanson() {{
        id = 623;
        titre = "Skullcrusher";
    }}, new Chanson() {{
        id = 624;
        titre = "Snoh Aalegra";
    }}, new Chanson() {{
        id = 625;
        titre = "Soeurs Dessureault";
    }}, new Chanson() {{
        id = 626;
        titre = "Sofiane Pamart";
    }}, new Chanson() {{
        id = 627;
        titre = "Sofiane Saidi";
    }}, new Chanson() {{
        id = 628;
        titre = "Soft Blade";
    }}, new Chanson() {{
        id = 629;
        titre = "Sophie Hunger";
    }}, new Chanson() {{
        id = 630;
        titre = "Stardust";
    }}, new Chanson() {{
        id = 631;
        titre = "Starmania";
    }}, new Chanson() {{
        id = 632;
        titre = "Stealers Wheel";
    }}, new Chanson() {{
        id = 633;
        titre = "Steely Dan";
    }}, new Chanson() {{
        id = 634;
        titre = "Stephane Laforest";
    }}, new Chanson() {{
        id = 635;
        titre = "Steven Stern";
    }}, new Chanson() {{
        id = 636;
        titre = "Still Corners";
    }}, new Chanson() {{
        id = 637;
        titre = "Styleto";
    }}, new Chanson() {{
        id = 638;
        titre = "Stéphane Grappelli";
    }}, new Chanson() {{
        id = 639;
        titre = "Summer Walker";
    }}, new Chanson() {{
        id = 640;
        titre = "Supershy";
    }}, new Chanson() {{
        id = 641;
        titre = "Supertramp";
    }}, new Chanson() {{
        id = 642;
        titre = "Swedish House Mafia";
    }}, new Chanson() {{
        id = 643;
        titre = "Swing";
    }}, new Chanson() {{
        id = 644;
        titre = "Syd Barrett";
    }}, new Chanson() {{
        id = 645;
        titre = "TR/ST";
    }}, new Chanson() {{
        id = 646;
        titre = "TRIPLEGO";
    }}, new Chanson() {{
        id = 647;
        titre = "Taio Cruz";
    }}, new Chanson() {{
        id = 648;
        titre = "Talisco";
    }}, new Chanson() {{
        id = 649;
        titre = "Talking Heads";
    }}, new Chanson() {{
        id = 650;
        titre = "Tame Impala";
    }}, new Chanson() {{
        id = 651;
        titre = "Tamino";
    }}, new Chanson() {{
        id = 652;
        titre = "Tash Sultana";
    }}, new Chanson() {{
        id = 653;
        titre = "Tate McRae";
    }}, new Chanson() {{
        id = 654;
        titre = "Taylor Swift";
    }}, new Chanson() {{
        id = 655;
        titre = "Tempoe";
    }}, new Chanson() {{
        id = 656;
        titre = "Ten Fé";
    }}, new Chanson() {{
        id = 657;
        titre = "Ten Years After";
    }}, new Chanson() {{
        id = 658;
        titre = "Terrenoire";
    }}, new Chanson() {{
        id = 659;
        titre = "Tex Lecor";
    }}, new Chanson() {{
        id = 660;
        titre = "Tha Boy Myles";
    }}, new Chanson() {{
        id = 661;
        titre = "The 5th Dimension";
    }}, new Chanson() {{
        id = 662;
        titre = "The Andrews Sisters";
    }}, new Chanson() {{
        id = 663;
        titre = "The Animals";
    }}, new Chanson() {{
        id = 664;
        titre = "The Avener";
    }}, new Chanson() {{
        id = 665;
        titre = "The Balfa Brothers";
    }}, new Chanson() {{
        id = 666;
        titre = "The Beach Boys";
    }}, new Chanson() {{
        id = 667;
        titre = "The Beatles";
    }}, new Chanson() {{
        id = 668;
        titre = "The Blaze";
    }}, new Chanson() {{
        id = 669;
        titre = "The Blaze Velluto Collection";
    }}, new Chanson() {{
        id = 670;
        titre = "The Blessed Madonna";
    }}, new Chanson() {{
        id = 671;
        titre = "The Box Tops";
    }}, new Chanson() {{
        id = 672;
        titre = "The Centurians";
    }}, new Chanson() {{
        id = 673;
        titre = "The Crystals";
    }}, new Chanson() {{
        id = 674;
        titre = "The Dave Brubeck Quartet";
    }}, new Chanson() {{
        id = 675;
        titre = "The Doors";
    }}, new Chanson() {{
        id = 676;
        titre = "The Doug";
    }}, new Chanson() {{
        id = 677;
        titre = "The Dubliners";
    }}, new Chanson() {{
        id = 678;
        titre = "The First Edition";
    }}, new Chanson() {{
        id = 679;
        titre = "The Jordanaires";
    }}, new Chanson() {{
        id = 680;
        titre = "The Kinks";
    }}, new Chanson() {{
        id = 681;
        titre = "The Lively Ones";
    }}, new Chanson() {{
        id = 682;
        titre = "The Lovin' Spoonful";
    }}, new Chanson() {{
        id = 683;
        titre = "The Mamas & The Papas";
    }}, new Chanson() {{
        id = 684;
        titre = "The Mariachis";
    }}, new Chanson() {{
        id = 685;
        titre = "The Monkees";
    }}, new Chanson() {{
        id = 686;
        titre = "The Monks";
    }}, new Chanson() {{
        id = 687;
        titre = "The Mothers";
    }}, new Chanson() {{
        id = 688;
        titre = "The Mothers Of Invention";
    }}, new Chanson() {{
        id = 689;
        titre = "The National";
    }}, new Chanson() {{
        id = 690;
        titre = "The Plastic Ono Band";
    }}, new Chanson() {{
        id = 691;
        titre = "The Psychedelic Furs";
    }}, new Chanson() {{
        id = 692;
        titre = "The Revels";
    }}, new Chanson() {{
        id = 693;
        titre = "The Righteous Brothers";
    }}, new Chanson() {{
        id = 694;
        titre = "The Rolling Stones";
    }}, new Chanson() {{
        id = 695;
        titre = "The Smashing Pumpkins";
    }}, new Chanson() {{
        id = 696;
        titre = "The Smile";
    }}, new Chanson() {{
        id = 697;
        titre = "The Smiths";
    }}, new Chanson() {{
        id = 698;
        titre = "The Spy From Cairo";
    }}, new Chanson() {{
        id = 699;
        titre = "The Statler Brothers";
    }}, new Chanson() {{
        id = 700;
        titre = "The Stranglers";
    }}, new Chanson() {{
        id = 701;
        titre = "The Strokes";
    }}, new Chanson() {{
        id = 702;
        titre = "The Tornados";
    }}, new Chanson() {{
        id = 703;
        titre = "The Trinidad Singers";
    }}, new Chanson() {{
        id = 704;
        titre = "The Troggs";
    }}, new Chanson() {{
        id = 705;
        titre = "The Wave";
    }}, new Chanson() {{
        id = 706;
        titre = "The Weeknd";
    }}, new Chanson() {{
        id = 707;
        titre = "The White Stripes";
    }}, new Chanson() {{
        id = 708;
        titre = "The Zombies";
    }}, new Chanson() {{
        id = 709;
        titre = "Thomas Bangalter";
    }}, new Chanson() {{
        id = 710;
        titre = "Thundercat";
    }}, new Chanson() {{
        id = 711;
        titre = "Thylacine";
    }}, new Chanson() {{
        id = 712;
        titre = "Ti-Jean Carignan";
    }}, new Chanson() {{
        id = 713;
        titre = "Tierra Whack";
    }}, new Chanson() {{
        id = 714;
        titre = "Tim Rice";
    }}, new Chanson() {{
        id = 715;
        titre = "Timbaland";
    }}, new Chanson() {{
        id = 716;
        titre = "Tina Charles";
    }}, new Chanson() {{
        id = 717;
        titre = "Tito Rodriguez";
    }}, new Chanson() {{
        id = 718;
        titre = "Tom Misch";
    }}, new Chanson() {{
        id = 719;
        titre = "Tom Waits";
    }}, new Chanson() {{
        id = 720;
        titre = "Tom Zé";
    }}, new Chanson() {{
        id = 721;
        titre = "Tora";
    }}, new Chanson() {{
        id = 722;
        titre = "Tory Lanez";
    }}, new Chanson() {{
        id = 723;
        titre = "Toshi";
    }}, new Chanson() {{
        id = 724;
        titre = "Townes Van Zandt";
    }}, new Chanson() {{
        id = 725;
        titre = "Traumer";
    }}, new Chanson() {{
        id = 726;
        titre = "Triple eEe";
    }}, new Chanson() {{
        id = 727;
        titre = "Troye Sivan";
    }}, new Chanson() {{
        id = 728;
        titre = "Tsew The Kid";
    }}, new Chanson() {{
        id = 729;
        titre = "Two Another";
    }}, new Chanson() {{
        id = 730;
        titre = "Tyga";
    }}, new Chanson() {{
        id = 731;
        titre = "Téléphone";
    }}, new Chanson() {{
        id = 732;
        titre = "Unknown Artist";
    }}, new Chanson() {{
        id = 733;
        titre = "Vaarwell";
    }}, new Chanson() {{
        id = 734;
        titre = "Victony";
    }}, new Chanson() {{
        id = 735;
        titre = "Victorine";
    }}, new Chanson() {{
        id = 736;
        titre = "Vince Staples";
    }}, new Chanson() {{
        id = 737;
        titre = "Vishtèn";
    }}, new Chanson() {{
        id = 738;
        titre = "Véronique Sanson";
    }}, new Chanson() {{
        id = 739;
        titre = "WAYNE SNOW";
    }}, new Chanson() {{
        id = 740;
        titre = "WEISS";
    }}, new Chanson() {{
        id = 741;
        titre = "WILLIS";
    }}, new Chanson() {{
        id = 742;
        titre = "Wally Lopez";
    }}, new Chanson() {{
        id = 743;
        titre = "Wavey";
    }}, new Chanson() {{
        id = 744;
        titre = "Waxx";
    }}, new Chanson() {{
        id = 745;
        titre = "Will Heard";
    }}, new Chanson() {{
        id = 746;
        titre = "William Hennessey";
    }}, new Chanson() {{
        id = 747;
        titre = "Wings";
    }}, new Chanson() {{
        id = 748;
        titre = "Woodie Smalls";
    }}, new Chanson() {{
        id = 749;
        titre = "Woodkid";
    }}, new Chanson() {{
        id = 750;
        titre = "X-COAST";
    }}, new Chanson() {{
        id = 751;
        titre = "XXXTENTACION";
    }}, new Chanson() {{
        id = 752;
        titre = "Xavier Omär";
    }}, new Chanson() {{
        id = 753;
        titre = "Xinobi";
    }}, new Chanson() {{
        id = 754;
        titre = "YEИDRY";
    }}, new Chanson() {{
        id = 755;
        titre = "YG Pablo";
    }}, new Chanson() {{
        id = 756;
        titre = "Yellow House";
    }}, new Chanson() {{
        id = 757;
        titre = "YellowStraps x Le Motel";
    }}, new Chanson() {{
        id = 758;
        titre = "Yodelice";
    }}, new Chanson() {{
        id = 759;
        titre = "Yoko Ono";
    }}, new Chanson() {{
        id = 760;
        titre = "Yung Gravy";
    }}, new Chanson() {{
        id = 761;
        titre = "Yussef Dayes";
    }}, new Chanson() {{
        id = 762;
        titre = "Yusuf / Cat Stevens";
    }}, new Chanson() {{
        id = 763;
        titre = "Yves Lambert";
    }}, new Chanson() {{
        id = 764;
        titre = "Yves Prin";
    }}, new Chanson() {{
        id = 765;
        titre = "ZHU";
    }}, new Chanson() {{
        id = 766;
        titre = "Zamdane";
    }}, new Chanson() {{
        id = 767;
        titre = "Zedd";
    }}, new Chanson() {{
        id = 768;
        titre = "Zibz";
    }}, new Chanson() {{
        id = 769;
        titre = "Zimmer";
    }}, new Chanson() {{
        id = 770;
        titre = "Zoë Love Smith";
    }}, new Chanson() {{
        id = 771;
        titre = "bbno$";
    }}, new Chanson() {{
        id = 772;
        titre = "belzébuth";
    }}, new Chanson() {{
        id = 773;
        titre = "chien noir";
    }}, new Chanson() {{
        id = 774;
        titre = "dj poolboi";
    }}, new Chanson() {{
        id = 775;
        titre = "flowerovlove";
    }}, new Chanson() {{
        id = 776;
        titre = "l'Orchestre Oriental";
    }}, new Chanson() {{
        id = 777;
        titre = "lil yan";
    }}, new Chanson() {{
        id = 778;
        titre = "southstar";
    }}, new Chanson() {{
        id = 779;
        titre = "Édith Butler";
    }}, new Chanson() {{
        id = 780;
        titre = "Édith Piaf";
    }}, new Chanson() {{
        id = 781;
        titre = "Ólafur Arnalds";
    }});
}