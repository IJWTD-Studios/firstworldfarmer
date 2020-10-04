class mvcFarm.FarmGraphicView extends mvc.AbstractView
{
   function FarmGraphicView(m, c)
   {
      super(m,c);
   }
   function update(o, infoObj)
   {
      this.info = (mvcFarm.FarmInfo)infoObj;
   }
   function paint()
   {
      _root.flushMc(_root.investmentTarget);
      var _loc4_ = this.info.getInvestments();
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         _loc4_[_loc3_].paint();
         _loc4_[_loc3_].getPositionMC().enabled = false;
         _loc3_ = _loc3_ + 1;
      }
      _root.moneyText = this.info.getMoney();
      _root.familyMembersText = this.info.getFamilyMembers();
      this.attachFamilyMembers(this.info.getFamilyMembers());
      _root.updateButtons();
      _root.turnText = _root.turnCount;
      if(_root.communicationsBuilt)
      {
         _root.communicationsGraphic._visible = true;
      }
      else
      {
         _root.communicationsGraphic._visible = false;
      }
      if(_root.infrastructureBuilt)
      {
         _root.road._visible = true;
      }
      else
      {
         _root.road._visible = false;
      }
      if(_root.schoolBuilt)
      {
         _root.schoolGraphic._visible = true;
         trace(_root.school._x + "," + _root.school._y);
      }
      else
      {
         _root.schoolGraphic._visible = false;
      }
      if(_root.clinicBuilt)
      {
         _root.clinicGraphic._visible = true;
      }
      else
      {
         _root.clinicGraphic._visible = false;
      }
      if(_root.representativeBuilt)
      {
         _root.representativeGraphic._visible = true;
      }
      else
      {
         _root.representativeGraphic._visible = false;
      }
      if(_root.insuranceBuilt)
      {
         _root.insuranceGraphic._visible = true;
      }
      else
      {
         _root.insuranceGraphic._visible = false;
      }
   }
   function attachFamilyMembers(count)
   {
      for(var _loc7_ in _root.familyMemberTarget)
      {
         if(typeof _root.familyMemberTarget[_loc7_] == "movieclip")
         {
            _root.familyMemberTarget[_loc7_].removeMovieClip();
         }
      }
      var _loc4_ = this.info.getFamily();
      var _loc3_ = 1;
      while(_loc3_ <= count)
      {
         _loc4_[_loc3_ - 1].findSprite();
         var _loc5_ = _loc4_[_loc3_ - 1].paint((1 - _loc3_) * 25,_loc4_[_loc3_ - 1].getID());
         _loc5_._y = 0;
         _loc3_ = _loc3_ + 1;
      }
   }
}
