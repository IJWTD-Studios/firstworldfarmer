stop();
this._lockroot = true;
System.useCodepage = false;
var gg = this;
var lang = new languages.Language();
var flagButtons = [englishButton,danishButton,spanishButton,frenchButton,czechButton,italianButton,germanButton,hungarianButton,brazilianButton];
playerButton.onRelease = function()
{
   if(!gg.tutorial._visible)
   {
      gg.stepToIntroText();
   }
   else
   {
      gg.gotoAndPlay("init");
   }
};
fbButton.onRelease = function()
{
   getUrl("https://github.com/dippyshere/firstworldfarmer", "_blank");
};
stepToIntroText = function()
{
   HowToText._alpha = 100;
   Bg._alpha = 0;
   endurebox._alpha = 0;
   tagbox._alpha = 0;
   tutorial._visible = true;
};
danishButton.onRelease = function()
{
   gg.showFlagButtonsExcept(danishButton);
   gg.lang.setLanguage("da");
};
englishButton.onRelease = function()
{
   gg.showFlagButtonsExcept(englishButton);
   gg.lang.setLanguage("en");
};
spanishButton.onRelease = function()
{
   gg.showFlagButtonsExcept(spanishButton);
   gg.lang.setLanguage("es");
};
frenchButton.onRelease = function()
{
   gg.showFlagButtonsExcept(frenchButton);
   gg.lang.setLanguage("fr");
};
czechButton.onRelease = function()
{
   gg.showFlagButtonsExcept(czechButton);
   gg.lang.setLanguage("cz");
};
italianButton.onRelease = function()
{
   gg.showFlagButtonsExcept(italianButton);
   gg.lang.setLanguage("it");
};
germanButton.onRelease = function()
{
   gg.showFlagButtonsExcept(germanButton);
   gg.lang.setLanguage("de");
};
hungarianButton.onRelease = function()
{
   gg.showFlagButtonsExcept(hungarianButton);
   gg.lang.setLanguage("hu");
};
brazilianButton.onRelease = function()
{
   gg.showFlagButtonsExcept(brazilianButton);
   gg.lang.setLanguage("pt");
};
var showFlagButtonsExcept = function(b)
{
   for(var _loc2_ in flagButtons)
   {
      if(flagButton[_loc2_] != b)
      {
         flagButton[_loc2_]._visible = true;
      }
      else
      {
         flagButton[_loc2_]._visible = false;
      }
   }
};
var initMenus = function()
{
   gg.HowToText._alpha = 0;
   gg.tutorial._visible = false;
};
gg.initMenus();
