class mvcFarm.FarmInfoBoxView extends mvc.AbstractView
{
   function FarmInfoBoxView(m, c)
   {
      super(m,c);
   }
   function update(o, infoObj)
   {
      this.info = (mvcFarm.FarmInfo)infoObj;
      this.paint();
   }
   function paint()
   {
      _root.IObox.picTargetMC.attachMovie(_root.currentEvent.image,_root.currentEvent.image + "_mc",19);
      _root.IObox.eventText = "<b>" + _root.currentEvent.title + "</b>\n" + _root.currentEvent.description;
      _root.IObox.eventText = _root.IObox.eventText + ("\n<b>(" + _root.currentEvent.secDescription + ")</b>");
      var _loc7_ = this.info.getMoney() + _root.annualExpences - _root.currentRevenue;
      var _loc4_ = "<b>" + _root.ecInfBox1 + "</b>$ " + _loc7_ + _root.ecInfBox7 + "$ " + _root.currentRevenue + _root.ecInfBox2 + "$ " + _root.annualExpences + _root.ecInfBox3 + "$ " + this.info.getMoney() + _root.ecInfBox4;
      var _loc3_ = "<b><li>" + _root.ecInfBox4 + this.info.getMoney() + "</li></b>";
      if(_root.familyMemberDied)
      {
         var _loc6_ = "<b><li>" + _root.ecInfBox5 + "</li></b>";
         _loc4_ = _loc4_ + _loc6_;
         _loc3_ = _loc3_ + _loc6_;
      }
      if(_root.starvation)
      {
         _loc6_ = "<b><li>" + _root.ecInfBox5 + "</li></b>";
         _loc4_ = _loc4_ + _loc6_;
         _loc3_ = _loc3_ + _loc6_;
      }
      _loc6_ = "<b><li>" + _root.whoDiedFromLowHealth + "</li></b>";
      _loc4_ = _loc4_ + _loc6_;
      _loc3_ = _loc3_ + _loc6_;
      if(_root.childBornThisYear)
      {
         var _loc5_ = "<b><li>" + _root.ecInfBox8 + "</li></b>";
         _loc4_ = _loc4_ + _loc5_;
         _loc3_ = _loc3_ + _loc5_;
      }
      _loc4_ = _loc4_ + ("" + _root.ecInfBox6 + this.info.getFamilyMembers());
      _loc3_ = _loc3_ + ("<b><li>" + this.info.getFamilyMembers() + _root.ecInfBox6 + "</li></b>");
      if(_root.effectAffectuatedChemical)
      {
         _loc4_ = _loc4_ + _root.longTermCh;
         _loc3_ = _loc3_ + ("<b><li>" + _root.longTermCh + "</li></b>");
      }
      if(_root.effectAffectuatedOpium)
      {
         _loc4_ = _loc4_ + _root.longTermOp;
         _loc3_ = _loc3_ + ("<b><li>" + _root.longTermOp + "</li></b>");
      }
      if(_root.effectAffectuatedParamilitary)
      {
         _loc4_ = _loc4_ + _root.longTermPa;
         _loc3_ = _loc3_ + ("<b><li>" + _root.longTermPa + "</li></b>");
      }
      _root.economicsInfoBox.economicsText = _loc4_;
      _root.IObox.summaryText = _loc3_;
      _root.IObox.eventTextField.scroll = 0;
      _root.IObox.summary.scroll = 0;
   }
}
