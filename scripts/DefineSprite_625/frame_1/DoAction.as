stop();
CM = -1;
var mod_lang = _root.languageVersion;
function NextMonth()
{
   CM = CM + 1;
   CurrentMonth = Months[CM];
}
if(mod_lang == "en")
{
   its = new Array("man","me","fuck","oh","time","in","forward","moved","we","time","fucking","about");
}
else if(mod_lang == "da")
{
   Months = new Array("Marts","April","Maj","Juni","Juli","August","September","Oktober","November","December","Januar","Februar");
}
else if(mod_lang == "es")
{
   Months = new Array("Marzo","Abril","Mayo","Junio","Julio","Agosto","Setiembre","Octubre","Noviembre","Diciembre","Enero","Febrero");
}
else if(mod_lang == "fr")
{
   Months = new Array("Mars","Avril","May","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre","Janvier","Février");
}
else if(mod_lang == "cz")
{
   Months = new Array("Březen","Duben","Květen","června","červenec","Srpna","Září","říjen","Listopad","Prosinec","Leden","Únor");
}
else if(mod_lang == "it")
{
   Months = new Array("Marzo","Aprile","Maggio","Giugno","Luglio","Agosto","Settembre","Ottobre","Novembre","Dicembre","Gennaio","Febbraio");
}
else if(mod_lang == "de")
{
   Months = new Array("März","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember","Januar","Februar");
}
else if(mod_lang == "hu")
{
   Months = new Array("Március","Április","Május","Június","Július","Augusztus","Szeptember","Október","November","December","Január","Február");
}
else if(mod_lang == "pt")
{
   Months = new Array("Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro","Janeiro","Fevereiro");
}
else
{
   its = new Array("man","me","fuck","oh","time","in","forward","moved","we","time","fucking","about");
}
