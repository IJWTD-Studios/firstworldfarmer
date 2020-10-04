stop();
var currentRevenue;
IObox.eventScrollUp.onPress = function()
{
   _root.IObox.eventTextField.scroll = _root.IObox.eventTextField.scroll - 1;
};
IObox.eventScrollDown.onPress = function()
{
   _root.IObox.eventTextField.scroll = _root.IObox.eventTextField.scroll + 1;
};
IObox.summaryScrollUp.onPress = function()
{
   _root.IObox.summary.scroll = _root.IObox.summary.scroll - 1;
};
IObox.summaryScrollDown.onPress = function()
{
   _root.IObox.summary.scroll = _root.IObox.summary.scroll + 1;
};
var flushMc = function(mc)
{
   for(var _loc2_ in mc)
   {
      if(typeof mc[_loc2_] == "movieclip")
      {
         mc[_loc2_].removeMovieClip();
      }
   }
};
IObox.exitButton.onPress = function()
{
   for(var _loc9_ in _root.IObox.picTargetMC)
   {
      _root.IObox.picTargetMC[_loc9_].removeMovieClip();
   }
   _root.IObox._visible = false;
   _root.flushMc(_root.barrelTarget);
   _root.flushMc(_root.milcampTarget);
   if(_root.communicationsBuilt && _root.infrastructureBuilt && _root.schoolBuilt && _root.clinicBuilt && _root.representativeBuilt && _root.insuranceBuilt)
   {
      _root.reasonForGameEnd = "win";
      gotoAndStop("gameOver");
      return undefined;
   }
   if(farmModel.getFamilyMembers() < 1)
   {
      gotoAndStop("gameOver");
   }
   else if(farmModel.getFamilyMembers() > 0)
   {
      var _loc3_ = farmModel.getFamily();
      var _loc5_ = false;
      var _loc7_ = false;
      var _loc6_ = false;
      var _loc8_ = undefined;
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].getAtSchool())
         {
            farmModel.setPersonAtSchool(_loc2_,false);
         }
         if(_loc3_[_loc2_].getAge() > _loc4_)
         {
            _loc4_ = _loc3_[_loc2_].getAge();
         }
         if(_loc3_[_loc2_].getSpouse())
         {
            _loc7_ = true;
         }
         if(_loc3_[_loc2_].getHeadOfFamily())
         {
            _loc5_ = true;
            _loc6_ = _loc3_[_loc2_].getGender();
            _loc8_ = _loc3_[_loc2_].getAge();
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_ < 8)
      {
         _root.reasonForGameEnd = "noadultsleft";
         gotoAndStop("gameOver");
         return undefined;
      }
      if(farmModel.getMoney() >= _root.minMoney && random(11) + 1 != 1)
      {
         gotoAndStop("phase1");
      }
      else if(random(100) > _root.poorEventCounter)
      {
         if(_root.poorEventCounter < 90)
         {
            _root.poorEventCounter = _root.poorEventCounter + 10;
         }
         poorEvent = random(5) + 1;
         if(poorEvent == 1)
         {
            _root.brokeInfoBoxTribalDance._visible = true;
         }
         else if(poorEvent == 2)
         {
            _root.brokeInfoBoxChemical._visible = true;
         }
         else if(poorEvent == 3)
         {
            _root.brokeInfoBoxParamilitary._visible = true;
         }
         else if(poorEvent == 4)
         {
            _root.brokeInfoBoxOpium._visible = true;
            _root.poppyAmount = random(5) + 3;
         }
         else if(poorEvent == 5)
         {
            if(farmModel.getFamilyMembers() > 2)
            {
               _root.brokeInfoBoxCityMigrate._visible = true;
            }
            else
            {
               _root.brokeInfoBoxTribalDance._visible = true;
            }
         }
      }
      else
      {
         gotoAndStop("phase1");
      }
   }
   _root.effectAffectuatedChemical = false;
   _root.effectAffectuatedOpium = false;
   _root.effectAffectuatedParamilitary = false;
};
brokeInfoBoxChemical.declineButton.onPress = function()
{
   gotoAndStop("phase1");
};
brokeInfoBoxTribalDance.declineButton.onPress = function()
{
   gotoAndStop("phase1");
};
brokeInfoBoxOpium.declineButton.onPress = function()
{
   gotoAndStop("phase1");
};
brokeInfoBoxCityMigrate.declineButton.onPress = function()
{
   gotoAndStop("phase1");
};
brokeInfoBoxParamilitary.declineButton.onPress = function()
{
   gotoAndStop("phase1");
};
brokeInfoBoxChemical.acceptButton.onPress = function()
{
   _root.barrelTarget.attachMovie("barrels","barrels",1);
   farmModel.setMoney(farmModel.getMoney() + _root.brokeEarningChemical);
   _root.longTimeEffectChemical = true;
   gotoAndStop("phase1");
};
brokeInfoBoxTribalDance.acceptButton.onPress = function()
{
   farmModel.setMoney(farmModel.getMoney() + _root.brokeEarningTribalDance);
   gotoAndStop("phase1");
};
brokeInfoBoxCityMigrate.acceptButton.onPress = function()
{
   farmModel.removeOneFamilyMember(random(farmModel.getFamily().length));
   farmModel.setMoney(farmModel.getMoney() + _root.brokeEarningCityMigrate);
   farmGraphicView.paint();
   gotoAndStop("phase1");
};
brokeInfoBoxOpium.acceptButton.onPress = function()
{
   farmModel.setMoney(farmModel.getMoney() + _root.brokeEarningOpium);
   _root.longTimeEffectOpium = true;
   gotoAndStop("phase1");
};
brokeInfoBoxParamilitary.acceptButton.onPress = function()
{
   _root.milcampTarget.attachMovie("milcamp","milcamp",1);
   farmModel.setMoney(farmModel.getMoney() + _root.brokeEarningParamilitary);
   _root.longTimeEffectParamilitary = true;
   gotoAndStop("phase1");
};
