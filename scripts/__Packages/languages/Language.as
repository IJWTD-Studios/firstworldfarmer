class languages.Language
{
   function Language()
   {
      this.daObj = new languages.Danish();
      this.enObj = new languages.English();
      this.esObj = new languages.Spanish();
      this.czObj = new languages.Czech();
      this.frObj = new languages.French();
      this.deObj = new languages.German();
      this.chObj = new languages.Chinese();
      this.itObj = new languages.Italian();
      this.huObj = new languages.Hungarian();
      this.ptObj = new languages.Portuguese();
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
      var _loc5_ = this[id].split("&");
      for(var _loc8_ in _loc5_)
      {
         var _loc3_ = _loc5_[_loc8_].split("=");
         _root[_loc3_[0]] = _loc3_[1];
         if(_loc3_[0] == "Allchoices")
         {
            _root.Allchoices = _root.Allchoices.split(",");
         }
      }
      var _loc6_ = this[id + "_intro"].split("&");
      for(var _loc7_ in _loc6_)
      {
         var _loc4_ = _loc6_[_loc7_].split("=");
         _root[_loc4_[0]] = _loc4_[1];
      }
   }
}
