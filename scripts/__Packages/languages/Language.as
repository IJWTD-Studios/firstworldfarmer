class languages.Language
{
   function Language()
   {
      this.daObj = new languages.Danish();
      this.enObj = new languages.English();
      this.da = this.daObj.getStrings();
      this.en = this.enObj.getStrings();
      this.es = this.esObj.getStrings();
      this.cz = this.czObj.getStrings();
      this.fr = this.frObj.getStrings();
      this.de = this.deObj.getStrings();
      this.ch = this.chObj.getStrings();
      this.it = this.itObj.getStrings();
      this.hu = this.huObj.getStrings();
      this.pt = this.ptObj.getStrings();
      this.da_intro = this.daObj.getIntroString();
      this.en_intro = this.enObj.getIntroString();
      this.es_intro = this.esObj.getIntroString();
      this.cz_intro = this.czObj.getIntroString();
      this.fr_intro = this.frObj.getIntroString();
      this.de_intro = this.deObj.getIntroString();
      this.ch_intro = this.chObj.getIntroString();
      this.it_intro = this.itObj.getIntroString();
      this.hu_intro = this.huObj.getIntroString();
      this.pt_intro = this.ptObj.getIntroString();
      this.setLanguage("en");
   }
   function setLanguage(id)
   {
      trace("Running function language.setLanguage(id:String), param = " + id);
      _root.languageVersion = id;
      var _loc4_ = this[id].split("&");
      for(var _loc5_ in _loc4_)
      {
         var _loc6_ = _loc4_[_loc5_].split("=");
         _root[_loc6_[0]] = _loc6_[1];
         if(_loc6_[0] == "Allchoices")
         {
            _root.Allchoices = _root.Allchoices.split(",");
         }
      }
      var _loc7_ = this[id + "_intro"].split("&");
      for(var _loc8_ in _loc7_)
      {
         var _loc9_ = _loc7_[_loc8_].split("=");
         _root[_loc9_[0]] = _loc9_[1];
      }
   }
}
