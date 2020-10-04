stop();
familyMemberInfoBox._visible = false;
giveMedicineInfoBox._visible = false;
haveBabyInfoBox._visible = false;
goToSchoolInfoBox._visible = false;
familyHeadInfoBox._visible = false;
leaveFarmInfoBox._visible = false;
marriageInfoBox._visible = false;
var whichFamilyMemberActive = 0;
var marriageProposalPrice = 0;
warningBox._visible = false;
familyHelp._visible = false;
leaveFarmReward = 0;
leaveFarmPointsAwarded = 0;
var cornPrice = Math.floor(Math.random(1) * 9) + 5;
var cornMultiplier = randRange(cornPrice + 1,cornPrice + 2);
var wheatPrice = Math.floor(Math.random(1) * 13) + 8;
var wheatMultiplier = randRange(wheatPrice + 1,wheatPrice + 4);
var cottonPrice = Math.floor(Math.random(1) * 9) + 15;
var cottonMultiplier = randRange(cottonPrice + 1,cottonPrice + 5);
var peanutPrice = Math.floor(Math.random(1) * 3) + 19;
var peanutMultiplier = randRange(peanutPrice - peanutPrice / 2,peanutPrice + peanutPrice / 2 + 3);
function randRange(min, max)
{
   var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
   return Math.round(_loc1_);
}
function handleClickDisposeMC()
{
   _root.setTilesVisibility("cropTile",false);
   _root.setTilesVisibility("livestockTile",false);
   _root.setTilesVisibility("toolTile",false);
   _root.setTilesVisibility("constructionTile",false);
   _root.disposeMC.enabled = false;
}
function popTxt(t)
{
   trace("running function popTxt with param:" + t);
   if(_root.cursorObject == undefined)
   {
      var _loc15_ = String(t).split(".");
      var _loc2_ = _loc15_[2].slice(0,-6);
      var _loc5_ = "";
      if(_loc2_ == "corn" || _loc2_ == "wheat" || _loc2_ == "cotton" || _loc2_ == "peanut" || _loc2_ == "poppy")
      {
         _loc5_ = "crop";
      }
      else if(_loc2_ == "chicken" || _loc2_ == "pig" || _loc2_ == "cow" || _loc2_ == "elephant")
      {
         _loc5_ = "livestock";
      }
      else if(_loc2_ == "well" || _loc2_ == "shed" || _loc2_ == "barn")
      {
         _loc5_ = "construction";
      }
      else if(_loc2_ == "shovel" || _loc2_ == "scythe" || _loc2_ == "plow" || _loc2_ == "tractor" || _loc2_ == "harvester")
      {
         _loc5_ = "tool";
      }
      else if(_loc2_ == "communications" || _loc2_ == "infrastructure" || _loc2_ == "school" || _loc2_ == "clinic" || _loc2_ == "representative" || _loc2_ == "insurance")
      {
         _loc5_ = "project";
      }
      var _loc12_ = _root[_loc2_ + "tip"].split(".");
      var _loc14_ = _loc12_[0];
      var _loc13_ = _loc12_[1];
      var _loc6_ = _root[_loc5_ + "MenuChoices"][_loc2_ + "Button"].dependency[0];
      var _loc4_ = 1;
      while(_loc4_ < _root[_loc5_ + "MenuChoices"][_loc2_ + "Button"].dependency.length)
      {
         _loc6_ = _loc6_ + "," + _root[_loc5_ + "MenuChoices"][_loc2_ + "Button"].dependency[_loc4_];
         _loc4_ = _loc4_ + 1;
      }
      var _loc7_ = _loc6_.split(",");
      var _loc9_ = _root[_loc7_[0] + "tip"].split(".");
      var _loc8_ = _loc9_[0];
      var _loc3_ = 1;
      while(_loc3_ < _loc7_.length)
      {
         _loc9_ = _root[_loc7_[_loc3_] + "tip"].split(".");
         _loc8_ = _loc8_ + ", " + _loc9_[0];
         _loc3_ = _loc3_ + 1;
      }
      _loc6_ = _loc8_;
      if(_loc6_ == undefined)
      {
         _loc6_ = "";
      }
      _root.PopUpMov.header = _loc14_;
      _root.PopUpMov.tip = _loc13_;
      _root.PopUpMov.depen = _loc6_;
      _root.PopUpMov._visible = true;
      _root.PopUpMov.gotoAndPlay("start");
      _root.PopUpMov._y = _root._ymouse;
      var _loc11_ = _root._xmouse;
      var _loc10_ = 5;
      if(_loc11_ < 80)
      {
         _root.PopUpMov._x = 80 + _loc10_;
      }
      else if(_loc11_ < 125)
      {
         _root.PopUpMov._x = 125 + _loc10_;
      }
      else if(_loc11_ < 170)
      {
         _root.PopUpMov._x = 170 + _loc10_;
      }
      else if(_loc11_ < 215)
      {
         _root.PopUpMov._x = 215 + _loc10_;
      }
      else
      {
         _root.PopUpMov._x = 260 + _loc10_;
      }
   }
}
function popTxtOut()
{
   trace("Running function popTxtOut()");
   _root.PopUpMov._visible = false;
}
function popTxtOutClick()
{
   trace("Running popTxtOutClick()");
   _root.PopUpMov._visible = false;
}
function initButtons()
{
   var parent = this;
   var _loc3_ = 0;
   while(_loc3_ < bButtons.length)
   {
      bButtons[_loc3_].sItem = classForName(bButtons[_loc3_]).getLinkageName();
      bButtons[_loc3_].price = parent[bButtons[_loc3_].sItem + "Price"];
      bButtons[_loc3_].dependency = parent[bButtons[_loc3_].sItem + "Dependency"];
      bButtons[_loc3_].onRollOver = function()
      {
         parent.popTxt(this);
      };
      bButtons[_loc3_].onRollOut = bButtons[_loc3_].onReleaseOutside = function()
      {
         parent.popTxtOut();
      };
      bButtons[_loc3_].onRelease = function()
      {
         if(!(this.greyOverlay._visible || this.greenCheck._visible))
         {
            if(_root.numberOfProjectsBuilt == 5)
            {
               _root.openWarningBox();
            }
            else
            {
               switch(this.sItem)
               {
                  case "infrastructure":
                     _root.infrastructureBuilt = true;
                     break;
                  case "communications":
                     _root.communicationsBuilt = true;
                     break;
                  case "clinic":
                     _root.clinicBuilt = true;
                     break;
                  case "school":
                     _root.schoolBuilt = true;
                     break;
                  case "representative":
                     _root.representativeBuilt = true;
                     break;
                  case "insurance":
                     _root.insuranceBuilt = true;
               }
               _root.numberOfProjectsBuilt = _root.numberOfProjectsBuilt + 1;
               _root.farmModel.setMoney(_root.farmModel.getMoney() - this.price);
               _root.farmGraphicView.paint();
               updateButtons();
            }
         }
      };
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < aButtons.length)
   {
      aButtons[_loc3_].sItem = classForName(aButtons[_loc3_]).getLinkageName();
      aButtons[_loc3_].onRollOver = function()
      {
         parent.popTxt(this);
      };
      aButtons[_loc3_].onRollOut = aButtons[_loc3_].onReleaseOutside = function()
      {
         parent.popTxtOut();
      };
      aButtons[_loc3_].onRelease = function()
      {
         if(this.greyOverlay._visible == false)
         {
            if(_root.cursorObject == undefined)
            {
               parent.popTxtOutClick();
               parent.investment = parent.classForName(this);
               parent.investment.buttonName = this;
               parent.cursorObject = _root.attachMovie(this.sItem,this.sItem,1);
               var _loc3_ = parent.investment.getCategoryName().toLowerCase();
               _root.handleClickDisposeMC();
               parent.setTilesVisibility(_loc3_ + "Tile",true);
               parent.setCursorObject();
               parent.disposeMC.enabled = true;
            }
         }
      };
      if(parent[aButtons[_loc3_].sItem + "Price"] == 0)
      {
         aButtons[_loc3_].price = parent[aButtons[_loc3_].sItem + "Amount"];
         aButtons[_loc3_].amount = parent[aButtons[_loc3_].sItem + "Amount"];
      }
      else
      {
         aButtons[_loc3_].price = parent[aButtons[_loc3_].sItem + "Price"];
      }
      aButtons[_loc3_].dependency = parent[aButtons[_loc3_].sItem + "Dependency"];
      _loc3_ = _loc3_ + 1;
   }
}
function openWarningBox()
{
   _root.warningBox._visible = true;
}
function classForName(mButton)
{
   switch(mButton)
   {
      case cropMenuChoices.cornButton:
         return new investments.Corn();
      case cropMenuChoices.wheatButton:
         return new investments.Wheat();
      case cropMenuChoices.cottonButton:
         return new investments.Cotton();
      case cropMenuChoices.peanutButton:
         return new investments.Peanut();
      case cropMenuChoices.poppyButton:
         return new investments.Poppy();
      case livestockMenuChoices.chickenButton:
         return new investments.Chicken();
      case livestockMenuChoices.pigButton:
         return new investments.Pig();
      case livestockMenuChoices.cowButton:
         return new investments.Cow();
      case livestockMenuChoices.elephantButton:
         return new investments.Elephant();
      case toolMenuChoices.shovelButton:
         return new investments.Shovel();
      case toolMenuChoices.scytheButton:
         return new investments.Scythe();
      case toolMenuChoices.plowButton:
         return new investments.Plow();
      case toolMenuChoices.tractorButton:
         return new investments.Tractor();
      case toolMenuChoices.harvesterButton:
         return new investments.Harvester();
      case constructionMenuChoices.shedButton:
         return new investments.Shed();
      case constructionMenuChoices.wellButton:
         return new investments.Well();
      case constructionMenuChoices.barnButton:
         return new investments.Barn();
      case projectMenuChoices.communicationsButton:
         return new investments.Communications();
      case projectMenuChoices.infrastructureButton:
         return new investments.Infrastructure();
      case projectMenuChoices.schoolButton:
         return new investments.School();
      case projectMenuChoices.clinicButton:
         return new investments.Clinic();
      case projectMenuChoices.representativeButton:
         return new investments.Representative();
      case projectMenuChoices.insuranceButton:
         return new investments.Insurance();
      default:
   }
}
function updateButtons()
{
   for(var _loc4_ in cropMenuChoices)
   {
      if(typeof cropMenuChoices[_loc4_] == "movieclip")
      {
         cropMenuChoices[_loc4_].greyOverlay._visible = _root.farmModel.getMoney() < cropMenuChoices[_loc4_].price;
         if(cropMenuChoices[_loc4_].amount != undefined)
         {
            cropMenuChoices[_loc4_].buttonBG.priceText = _root.poppyAmount;
            if(_root.poppyAmount > 0)
            {
               cropMenuChoices[_loc4_].greyOverlay._visible = !_root.longTimeEffectOpium;
            }
            else
            {
               cropMenuChoices[_loc4_].greyOverlay._visible = true;
            }
         }
      }
   }
   for(var _loc4_ in livestockMenuChoices)
   {
      if(typeof livestockMenuChoices[_loc4_] == "movieclip")
      {
         if(livestockMenuChoices[_loc4_].price <= _root.farmModel.getMoney())
         {
            i = 0;
            while(i < livestockMenuChoices[_loc4_].dependency.length)
            {
               if(farmModel.checkInvestment(livestockMenuChoices[_loc4_].dependency[i]))
               {
                  livestockMenuChoices[_loc4_].greyOverlay._visible = false;
                  i++;
                  continue;
               }
               livestockMenuChoices[_loc4_].greyOverlay._visible = true;
               break;
            }
         }
         else
         {
            livestockMenuChoices[_loc4_].greyOverlay._visible = true;
         }
      }
   }
   for(var _loc4_ in toolMenuChoices)
   {
      if(typeof toolMenuChoices[_loc4_] == "movieclip")
      {
         toolMenuChoices[_loc4_].greyOverlay._visible = _root.farmModel.getMoney() < toolMenuChoices[_loc4_].price;
      }
   }
   for(var _loc4_ in constructionMenuChoices)
   {
      if(typeof constructionMenuChoices[_loc4_] == "movieclip")
      {
         constructionMenuChoices[_loc4_].greyOverlay._visible = _root.farmModel.getMoney() < constructionMenuChoices[_loc4_].price;
      }
   }
   for(var _loc4_ in projectMenuChoices)
   {
      if(typeof projectMenuChoices[_loc4_] == "movieclip")
      {
         var _loc2_ = false;
         var _loc3_ = projectMenuChoices[_loc4_]._name;
         if(_loc3_ == "communicationsButton")
         {
            if(_root.communicationsBuilt)
            {
               _loc2_ = true;
            }
         }
         else if(projectMenuChoices[_loc4_]._name == "infrastructureButton")
         {
            if(_root.infrastructureBuilt)
            {
               _loc2_ = true;
            }
         }
         else if(projectMenuChoices[_loc4_]._name == "schoolButton")
         {
            if(_root.schoolBuilt)
            {
               _loc2_ = true;
            }
         }
         else if(projectMenuChoices[_loc4_]._name == "clinicButton")
         {
            if(_root.clinicBuilt)
            {
               _loc2_ = true;
            }
         }
         else if(projectMenuChoices[_loc4_]._name == "representativeButton")
         {
            if(_root.representativeBuilt)
            {
               _loc2_ = true;
            }
         }
         else if(projectMenuChoices[_loc4_]._name == "insuranceButton")
         {
            if(_root.insuranceBuilt)
            {
               _loc2_ = true;
            }
         }
         if(_loc2_)
         {
            projectMenuChoices[_loc4_].greyOverlay._visible = false;
            projectMenuChoices[_loc4_].greenCheck._visible = true;
         }
         else
         {
            projectMenuChoices[_loc4_].greenCheck._visible = false;
            if(projectMenuChoices[_loc4_].price <= _root.farmModel.getMoney())
            {
               projectMenuChoices[_loc4_].greyOverlay._visible = false;
            }
            else
            {
               projectMenuChoices[_loc4_].greyOverlay._visible = true;
            }
            if(projectMenuChoices[_loc4_]._name == "insuranceButton")
            {
               if(!_root.representativeBuilt)
               {
                  projectMenuChoices[_loc4_].greyOverlay._visible = true;
               }
            }
         }
      }
   }
}
function setButtonPrices()
{
   for(var _loc1_ in cropMenuChoices)
   {
      if(typeof cropMenuChoices[_loc1_] == "movieclip")
      {
         cropMenuChoices[_loc1_].buttonBG.priceText = cropMenuChoices[_loc1_].price;
      }
   }
   for(var _loc1_ in livestockMenuChoices)
   {
      if(typeof livestockMenuChoices[_loc1_] == "movieclip")
      {
         livestockMenuChoices[_loc1_].buttonBG.priceText = livestockMenuChoices[_loc1_].price;
      }
   }
   for(var _loc1_ in toolMenuChoices)
   {
      if(typeof toolMenuChoices[_loc1_] == "movieclip")
      {
         toolMenuChoices[_loc1_].buttonBG.priceText = toolMenuChoices[_loc1_].price;
      }
   }
   for(var _loc1_ in constructionMenuChoices)
   {
      if(typeof constructionMenuChoices[_loc1_] == "movieclip")
      {
         constructionMenuChoices[_loc1_].buttonBG.priceText = constructionMenuChoices[_loc1_].price;
      }
   }
   for(var _loc1_ in projectMenuChoices)
   {
      if(typeof projectMenuChoices[_loc1_] == "movieclip")
      {
         projectMenuChoices[_loc1_].buttonBG.priceText = projectMenuChoices[_loc1_].price;
      }
   }
}
function setButtonDependencies()
{
   cropMenuChoices.cornButton.dependency = cornDependency;
   cropMenuChoices.wheatButton.dependency = wheatDependency;
   cropMenuChoices.cottonButton.dependency = cottonDependency;
   cropMenuChoices.peanutButton.dependency = peanutDependency;
   cropMenuChoices.poppyButton.dependency = poppyDependency;
   livestockMenuChoices.chickenButton.dependency = chickenDependency;
   livestockMenuChoices.pigButton.dependency = pigDependency;
   livestockMenuChoices.cowButton.dependency = cowDependency;
   livestockMenuChoices.elephantButton.dependency = elephantDependency;
   toolMenuChoices.shovelButton.dependency = shovelDependency;
   toolMenuChoices.scytheButton.dependency = scytheDependency;
   toolMenuChoices.plowButton.dependency = plowDependency;
   toolMenuChoices.tractorButton.dependency = tractorDependency;
   toolMenuChoices.harvesterButton.dependency = harvesterDependency;
   constructionMenuChoices.shedButton.dependency = shedDependency;
   constructionMenuChoices.wellButton.dependency = wellDependency;
   constructionMenuChoices.barnButton.dependency = barnDependency;
   projectMenuChoices.communicationsButton.dependency = communicationsDependency;
   projectMenuChoices.schoolButton.dependency = schoolDependency;
   projectMenuChoices.infrastructureButton.dependency = infrastructureDependency;
   projectMenuChoices.clinicButton.dependency = clinicDependency;
   projectMenuChoices.representativeButton.dependency = representativeDependency;
   projectMenuChoices.insuranceButton.dependency = insuranceDependency;
}
function setCursorObject()
{
   cursorObject._x = _root._xmouse;
   cursorObject._y = _root._ymouse;
   Mouse.hide();
}
function removeCursorObject()
{
   cursorObject.removeMovieClip();
   cursorObject = undefined;
   Mouse.show();
}
function setTilesVisibility(tileType, vis)
{
   var _loc2_ = 1;
   while(_loc2_ <= 18)
   {
      if(_root[tileType + _loc2_].enabled)
      {
         _root[tileType + _loc2_]._visible = vis;
      }
      else
      {
         _root[tileType + _loc2_]._visible = false;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function updateSellInfoBox()
{
   _root.sellInfoBox.sellChickenButton._visible = false;
   _root.sellInfoBox.sellPigButton._visible = false;
   _root.sellInfoBox.sellCowButton._visible = false;
   _root.sellInfoBox.sellElephantButton._visible = false;
   _root.sellInfoBox.sellShedButton._visible = false;
   _root.sellInfoBox.sellWellButton._visible = false;
   _root.sellInfoBox.sellBarnButton._visible = false;
   _root.sellInfoBox.sellShovelButton._visible = false;
   _root.sellInfoBox.sellScytheButton._visible = false;
   _root.sellInfoBox.sellPlowButton._visible = false;
   _root.sellInfoBox.sellTractorButton._visible = false;
   _root.sellInfoBox.sellHarvesterButton._visible = false;
   _root.sellChickenAvail = 0;
   _root.sellPigAvail = 0;
   _root.sellCowAvail = 0;
   _root.sellElephantAvail = 0;
   _root.sellShovelAvail = 0;
   _root.sellScytheAvail = 0;
   _root.sellPlowAvail = 0;
   _root.sellTractorAvail = 0;
   _root.sellHarvesterAvail = 0;
   _root.sellShedAvail = 0;
   _root.sellWellAvail = 0;
   _root.sellBarnAvail = 0;
   _root.sellChickenAvail = farmModel.checkInvestmentCount("chicken");
   _root.sellShovelAvail = farmModel.checkInvestmentCount("shovel");
   _root.sellPigAvail = farmModel.checkInvestmentCount("pig");
   _root.sellCowAvail = farmModel.checkInvestmentCount("cow");
   _root.sellElephantAvail = farmModel.checkInvestmentCount("elephant");
   _root.sellWellAvail = farmModel.checkInvestmentCount("well");
   _root.sellShedAvail = farmModel.checkInvestmentCount("shed");
   _root.sellBarnAvail = farmModel.checkInvestmentCount("barn");
   _root.sellScytheAvail = farmModel.checkInvestmentCount("scythe");
   _root.sellPlowAvail = farmModel.checkInvestmentCount("plow");
   _root.sellTractorAvail = farmModel.checkInvestmentCount("tractor");
   _root.sellHarvesterAvail = farmModel.checkInvestmentCount("harvester");
   _root.sellInfoBox.sellChickenButton._visible = farmModel.checkInvestment("chicken");
   _root.sellInfoBox.sellPigButton._visible = farmModel.checkInvestment("pig");
   _root.sellInfoBox.sellCowButton._visible = farmModel.checkInvestment("cow");
   _root.sellInfoBox.sellElephantButton._visible = farmModel.checkInvestment("elephant");
   _root.sellInfoBox.sellShedButton._visible = farmModel.checkInvestment("shed");
   _root.sellInfoBox.sellWellButton._visible = farmModel.checkInvestment("well");
   _root.sellInfoBox.sellBarnButton._visible = farmModel.checkInvestment("barn");
   _root.sellInfoBox.sellShovelButton._visible = farmModel.checkInvestment("shovel");
   _root.sellInfoBox.sellScytheButton._visible = farmModel.checkInvestment("scythe");
   _root.sellInfoBox.sellPlowButton._visible = farmModel.checkInvestment("plow");
   _root.sellInfoBox.sellTractorButton._visible = farmModel.checkInvestment("tractor");
   _root.sellInfoBox.sellHarvesterButton._visible = farmModel.checkInvestment("harvester");
}
function showFamilyHelp()
{
   _root.familyHelp.helpText = _root.help1 + "\n------------------------------\n" + _root.help2 + _root.help3 + "\n------------------------------\n" + _root.help4 + _root.help5 + "\n------------------------------\n" + _root.help6;
   familyHelp.textArea.scroll = 0;
   familyHelp._visible = true;
}
function closeFamilyHelp()
{
   familyHelp._visible = false;
}
function arrangeFamilyMemberInfoBox(who)
{
   if(cursorObject == undefined)
   {
      cropMenuChoices.gotoAndStop("closed");
      livestockMenuChoices.gotoAndStop("closed");
      toolMenuChoices.gotoAndStop("closed");
      constructionMenuChoices.gotoAndStop("closed");
      projectMenuChoices.gotoAndStop("closed");
      haveBabyInfoBox._visible = false;
      goToSchoolInfoBox._visible = false;
      familyHeadInfoBox._visible = false;
      leaveFarmInfoBox._visible = false;
      marriageInfoBox._visible = false;
      var _loc10_ = "failed";
      var _loc14_ = undefined;
      var _loc12_ = undefined;
      var _loc16_ = undefined;
      var _loc17_ = undefined;
      var _loc7_ = undefined;
      var _loc8_ = undefined;
      var _loc9_ = undefined;
      var _loc18_ = undefined;
      var _loc15_ = undefined;
      var _loc13_ = undefined;
      var _loc11_ = false;
      var _loc4_ = undefined;
      var _loc3_ = farmModel.getFamily();
      farmModel.updateWorkEfficiency();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].getID() == who)
         {
            _loc10_ = _loc3_[_loc2_].getName();
            _loc14_ = _loc3_[_loc2_].getAge();
            _loc12_ = _loc3_[_loc2_].getGender();
            _loc16_ = _loc3_[_loc2_].getHealth();
            _loc17_ = _loc3_[_loc2_].getFertile();
            _loc7_ = _loc3_[_loc2_].getEducationLvl();
            _loc8_ = _loc3_[_loc2_].getSpouse();
            _loc9_ = _loc3_[_loc2_].getHeadOfFamily();
            _loc18_ = _loc3_[_loc2_].getWorkEfficiency();
            _loc15_ = _loc3_[_loc2_].getPregnant();
            _loc13_ = _loc3_[_loc2_].getAtSchool();
            _root.whichFamilyMemberActive = who;
            _loc4_ = _loc2_;
         }
         if(_loc3_[_loc2_].getPregnant())
         {
            _loc11_ = true;
         }
         _loc2_ = _loc2_ + 1;
      }
      familyMemberInfoBox.nameLabel.text = _loc10_;
      familyMemberInfoBox.genderLabel.text = !_loc12_?_root.genderFemale:_root.genderMale;
      familyMemberInfoBox.healthLabel.text = _loc16_;
      familyMemberInfoBox.ageLabel.text = _loc14_;
      familyMemberInfoBox.workloadLabel.text = _loc18_ + "%";
      var _loc5_ = "";
      if(_loc9_)
      {
         _loc5_ = _root.titleHead;
      }
      else if(_loc8_)
      {
         _loc5_ = _root.titleSpouse;
      }
      else if(!_loc8_ && !_loc9_)
      {
         _loc5_ = _root.titleMember;
      }
      familyMemberInfoBox.titleLabel.text = _loc5_;
      if(_loc7_ == 0)
      {
         _loc5_ = _root.edNone;
      }
      else if(_loc7_ > 0)
      {
         _loc5_ = _loc7_ + " " + _root.edYears;
      }
      if(_loc13_)
      {
         _loc5_ = _loc5_ + _root.edInSchool;
      }
      familyMemberInfoBox.educationLabel.text = _loc5_;
      if(!_loc17_)
      {
         _loc5_ = _root.wordNo;
      }
      else if(!_loc15_)
      {
         _loc5_ = _root.wordYes;
      }
      else
      {
         _loc5_ = _root.fertilePregnant;
      }
      familyMemberInfoBox.fertileLabel.text = _loc5_;
      if(_loc3_[_loc4_].getMarriedTo() == -1)
      {
         familyMemberInfoBox.maritalLabel.text = _root.unmarried;
      }
      else
      {
         familyMemberInfoBox.maritalLabel.text = _loc3_[farmModel.getFamilyMemberById(_loc3_[_loc4_].getMarriedTo())].getName();
      }
      familyMemberInfoBox.healthBar.yellowBar._visible = false;
      familyMemberInfoBox.healthBar.redBar._visible = false;
      familyMemberInfoBox.healthBar.greenBar._visible = false;
      if(_loc3_[_loc4_].getHealth() > 74)
      {
         familyMemberInfoBox.healthBar.greenBar._visible = true;
         familyMemberInfoBox.healthBar.greenBar._xscale = _loc3_[_loc4_].getHealth();
      }
      else if(_loc3_[_loc4_].getHealth() > 24)
      {
         familyMemberInfoBox.healthBar.yellowBar._visible = true;
         familyMemberInfoBox.healthBar.yellowBar._xscale = _loc3_[_loc4_].getHealth();
      }
      else
      {
         familyMemberInfoBox.healthBar.redBar._visible = true;
         familyMemberInfoBox.healthBar.redBar._xscale = _loc3_[_loc4_].getHealth();
      }
      if(_loc3_[_loc4_].getHealth() < 100 && farmModel.getMoney() > 0)
      {
         familyMemberInfoBox.giveMedicineButton._visible = true;
      }
      else
      {
         familyMemberInfoBox.giveMedicineButton._visible = false;
      }
      if((_loc3_[_loc4_].getSpouse() || _loc3_[_loc4_].getHeadOfFamily()) && !_loc3_[_loc4_].getGender() && _loc3_[_loc4_].getPregnant() == false && _loc3_[_loc4_].getMarriedTo() != -1 && !_loc11_)
      {
         familyMemberInfoBox.haveBabyButton._visible = true;
      }
      else
      {
         familyMemberInfoBox.haveBabyButton._visible = false;
      }
      if(_loc3_[_loc4_].getMarriedTo() == -1 && _loc3_[_loc4_].getAge() > 17)
      {
         familyMemberInfoBox.marryButton._visible = true;
      }
      else
      {
         familyMemberInfoBox.marryButton._visible = false;
      }
      if(_loc3_[_loc4_].getEducationLvl() < 10 && !_loc3_[_loc4_].getAtSchool() && _loc3_[_loc4_].getAge() < 25 && _loc3_[_loc4_].getAge() > 4 && _loc3_[_loc4_].getHealth() > 50)
      {
         var _loc19_ = _root.schoolFee;
         if(_root.schoolBuilt)
         {
            _loc19_ = Math.round(_root.schoolFee / 2);
         }
         if(farmModel.getMoney() >= _loc19_)
         {
            familyMemberInfoBox.goToSchoolButton._visible = true;
         }
         else
         {
            familyMemberInfoBox.gotoSchoolButton._visible = false;
         }
      }
      else
      {
         familyMemberInfoBox.goToSchoolButton._visible = false;
      }
      if(!_loc3_[_loc4_].getHeadOfFamily())
      {
         familyMemberInfoBox.appointHeadOfFamilyButton._visible = true;
      }
      else
      {
         familyMemberInfoBox.appointHeadOfFamilyButton._visible = false;
      }
      familyMemberInfoBox.leaveFarmButton._visible = true;
      giveMedicineInfoBox._visible = false;
      familyMemberInfoBox._visible = true;
   }
   else
   {
      familyMemberInfoBox._visible = false;
   }
}
if(_root.infrastructureBuilt)
{
   cornPrice--;
   wheatPrice--;
   cottonPrice--;
   peanutPrice--;
}
if(_root.communicationsBuilt)
{
   cornMultiplier++;
   wheatMultiplier++;
   cottonMultiplier++;
   peanutMultiplier++;
}
_root.sellChickenPrice = Math.round(_root.chickenPrice / 2 + random(10) - 5);
_root.sellPigPrice = Math.round(_root.pigPrice / 2 + random(10) - 5);
_root.sellCowPrice = Math.round(_root.cowPrice / 2 + random(10) - 5);
_root.sellElephantPrice = Math.round(_root.elephantPrice / 2 + random(10) - 5);
_root.sellWellPrice = Math.round(_root.wellPrice / 2 + random(10) - 5);
_root.sellShedPrice = Math.round(_root.shedPrice / 2 + random(10) - 5);
_root.sellBarnPrice = Math.round(_root.barnPrice / 2 + random(10) - 5);
_root.sellShovelPrice = Math.round(_root.shovelPrice / 2 + random(10) - 5);
_root.sellScythePrice = Math.round(_root.scythePrice / 2 + random(10) - 5);
_root.sellPlowPrice = Math.round(_root.plowPrice / 2 + random(10) - 5);
_root.sellTractorPrice = Math.round(_root.tractorPrice / 2 + random(10) - 5);
_root.sellHarvesterPrice = Math.round(_root.harvesterPrice / 2 + random(10) - 5);
var activityCounter = 0;
eventInfoBox._visible = false;
economicsInfoBox._visible = false;
sellInfoBox._visible = false;
IObox._visible = false;
brokeInfoBoxChemical._visible = false;
brokeInfoBoxCityMigrate._visible = false;
brokeInfoBoxTribalDance._visible = false;
brokeInfoBoxParamilitary._visible = false;
brokeInfoBoxOpium._visible = false;
newWifeInfoBox._visible = false;
newHusbandInfoBox._visible = false;
familyMemberDied = false;
starvation = false;
childBornThisYear = false;
marriageThisYear = false;
if(random(100) < 60)
{
   marriageThisYear = true;
}
farmModel.updateWorkEfficiency();
farmGraphicView.paint();
var investment;
var annualExpences = livingCostsPP * farmModel.getFamilyMembers() + (Math.floor(5 * Math.random()) - 2);
onMouseMove = function()
{
   if(cursorObject != undefined)
   {
      cursorObject._x = _root._xmouse;
      cursorObject._y = _root._ymouse;
   }
   updateAfterEvent();
};
_root.setTilesVisibility("cropTile",false);
_root.setTilesVisibility("constructionTile",false);
_root.setTilesVisibility("toolTile",false);
_root.setTilesVisibility("livestockTile",false);
disposeMC.enabled = false;
disposeMC.onPress = function()
{
   _root.handleClickDisposeMC();
   _root.removeCursorObject();
};
var aButtons = [cropMenuChoices.cornButton,cropMenuChoices.wheatButton,cropMenuChoices.cottonButton,cropMenuChoices.peanutButton,cropMenuChoices.poppyButton,livestockMenuChoices.chickenButton,livestockMenuChoices.pigButton,livestockMenuChoices.cowButton,livestockMenuChoices.elephantButton,toolMenuChoices.shovelButton,toolMenuChoices.scytheButton,toolMenuChoices.plowButton,toolMenuChoices.tractorButton,toolMenuChoices.harvesterButton,constructionMenuChoices.shedButton,constructionMenuChoices.wellButton,constructionMenuChoices.barnButton];
var bButtons = [projectMenuChoices.communicationsButton,projectMenuChoices.infrastructureButton,projectMenuChoices.clinicButton,projectMenuChoices.representativeButton,projectMenuChoices.insuranceButton,projectMenuChoices.schoolButton];
initButtons();
warningBox.buildButton.onRelease = function()
{
   _root.numberOfProjectBuilt = 6;
   for(var _loc2_ in _root.bButtons)
   {
      if(!_root.bButtons[_loc2_].greenCheck._visible)
      {
         _root[_root.bButtons[_loc2_].sItem + "Built"] = true;
         _root.numberOfProjectsBuilt = _root.numberOfProjectsBuilt + 1;
         _root.farmModel.setMoney(_root.farmModel.getMoney() - _root.bButtons[_loc2_].price);
         _root.farmGraphicView.paint();
         updateButtons();
      }
   }
   _root.warningBox._visible = false;
};
warningBox.exitButton.onRelease = function()
{
   _root.warningBox._visible = false;
};
cropMenu.onRelease = function()
{
   familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   if(cursorObject == undefined)
   {
      if(cropMenuChoices._currentframe > 10)
      {
         cropMenuChoices.gotoAndStop("closed");
      }
      else
      {
         cropMenuChoices.gotoAndPlay("open");
      }
   }
};
livestockMenu.onRelease = function()
{
   familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   if(cursorObject == undefined)
   {
      if(livestockMenuChoices._currentframe > 10)
      {
         livestockMenuChoices.gotoAndStop("closed");
      }
      else
      {
         livestockMenuChoices.gotoAndPlay("open");
      }
   }
};
toolMenu.onRelease = function()
{
   familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   if(cursorObject == undefined)
   {
      if(toolMenuChoices._currentframe > 10)
      {
         toolMenuChoices.gotoAndStop("closed");
      }
      else
      {
         toolMenuChoices.gotoAndPlay("open");
      }
   }
};
constructionMenu.onRelease = function()
{
   familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   if(cursorObject == undefined)
   {
      if(constructionMenuChoices._currentframe > 10)
      {
         constructionMenuChoices.gotoAndStop("closed");
      }
      else
      {
         constructionMenuChoices.gotoAndPlay("open");
      }
   }
};
projectMenu.onRelease = function()
{
   familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   if(cursorObject == undefined)
   {
      if(projectMenuChoices._currentframe > 10)
      {
         projectMenuChoices.gotoAndStop("closed");
      }
      else
      {
         projectMenuChoices.gotoAndPlay("open");
      }
   }
};
updateButtons();
setButtonPrices();
setButtonDependencies();
var i = 1;
while(i <= 18)
{
   _root["cropTile" + i].onRelease = function()
   {
      _root.investment.setPositionMC(this);
      farmController.invest(investment);
      farmGraphicView.paint();
      this.gotoAndStop("start");
      activityCounter++;
      var _loc3_ = _root.investment.buttonName;
      _root.investment = _root.classForName(_loc3_);
      _root.investment.buttonName = _loc3_;
      var _loc4_ = !(investment.getPrice() == 0 && _root[investment.getLinkageName() + "Amount"] <= 0)?false:true;
      if(farmModel.getMoney() < investment.getPrice() || _loc4_)
      {
         removeCursorObject();
         setTilesVisibility("cropTile",false);
         _root.disposeMC.enabled = false;
      }
   };
   i++;
}
var i = 1;
while(i <= 7)
{
   _root["constructionTile" + i].onRelease = function()
   {
      _root.investment.setPositionMC(this);
      farmController.invest(investment);
      farmGraphicView.paint();
      this.gotoAndStop("start");
      var _loc3_ = _root.investment.buttonName;
      _root.investment = _root.classForName(_loc3_);
      _root.investment.buttonName = _loc3_;
      if(farmModel.getMoney() < investment.getPrice())
      {
         removeCursorObject();
         setTilesVisibility("constructionTile",false);
         _root.disposeMC.enabled = false;
      }
   };
   i++;
}
var i = 1;
while(i <= 4)
{
   _root["toolTile" + i].onRelease = function()
   {
      _root.investment.setPositionMC(this);
      farmController.invest(investment);
      farmGraphicView.paint();
      this.gotoAndStop("start");
      var _loc3_ = _root.investment.buttonName;
      _root.investment = _root.classForName(_loc3_);
      _root.investment.buttonName = _loc3_;
      if(farmModel.getMoney() < investment.getPrice())
      {
         removeCursorObject();
         setTilesVisibility("toolTile",false);
         _root.disposeMC.enabled = false;
      }
   };
   i++;
}
var i = 1;
while(i <= 8)
{
   _root["livestockTile" + i].onRelease = function()
   {
      _root.investment.setPositionMC(this);
      farmController.invest(investment);
      farmGraphicView.paint();
      this.gotoAndStop("start");
      var _loc3_ = _root.investment.buttonName;
      _root.investment = _root.classForName(_loc3_);
      _root.investment.buttonName = _loc3_;
      if(farmModel.getMoney() < investment.getPrice())
      {
         removeCursorObject();
         setTilesVisibility("livestockTile",false);
         _root.disposeMC.enabled = false;
      }
   };
   i++;
}
sellButton.onPress = function()
{
   if(cursorObject == undefined)
   {
      if(sellInfoBox._visible == false)
      {
         updateSellInfoBox();
         _root.familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
         cropMenuChoices.gotoAndStop("closed");
         livestockMenuChoices.gotoAndStop("closed");
         toolMenuChoices.gotoAndStop("closed");
         constructionMenuChoices.gotoAndStop("closed");
         projectMenuChoices.gotoAndStop("closed");
         cropMenu.enabled = false;
         livestockMenu.enabled = false;
         toolMenu.enabled = false;
         constructionMenu.enabled = false;
         projectMenu.enabled = false;
         sellInfoBox._visible = true;
      }
      else
      {
         sellInfoBox.exitButton.onPress();
      }
   }
};
sellInfoBox.exitButton.onPress = function()
{
   _root.sellInfoBox._visible = false;
   cropMenu.enabled = true;
   livestockMenu.enabled = true;
   toolMenu.enabled = true;
   constructionMenu.enabled = true;
   projectMenu.enabled = true;
   removeCursorObject();
};
familyHelp.exitButton.onRelease = function()
{
   _root.closeFamilyHelp();
};
var roll_up = function()
{
   gg.familyHelp.textArea.scroll = gg.familyHelp.textArea.scroll - 1;
};
var roll_down = function()
{
   gg.familyHelp.textArea.scroll = gg.familyHelp.textArea.scroll + 1;
};
var rollUp;
var rollDown;
familyHelp.upArrow.onRollOut = function()
{
   clearInterval(gg.rollUp);
};
familyHelp.downArrow.onRollOut = function()
{
   clearInterval(gg.rollDown);
};
familyHelp.upArrow.onRollOver = function()
{
   clearInterval(gg.rollUp);
   gg.rollUp = setInterval(gg.roll_up,40);
};
familyHelp.downArrow.onRollOver = function()
{
   clearInterval(gg.rollDown);
   gg.rollDown = setInterval(gg.roll_down,40);
};
familyMemberInfoBox.helpButton.onRelease = function()
{
   _root.showFamilyHelp();
};
familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress = function()
{
   familyMemberInfoBox._visible = false;
   giveMedicineInfoBox._visible = false;
   haveBabyInfoBox._visible = false;
   goToSchoolInfoBox._visible = false;
   familyHeadInfoBox._visible = false;
   leaveFarmInfoBox._visible = false;
   marriageInfoBox._visible = false;
   familyHelp._visible = false;
   sellButton.enabled = true;
   removeCursorObject();
};
familyMemberInfoBox.giveMedicineButton.onPress = function()
{
   var _loc7_ = _root.whichFamilyMemberActive;
   var _loc3_ = _root.farmModel.getFamily();
   var _loc5_ = 0;
   var _loc6_ = 0;
   var _loc4_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_].getID() == _loc7_)
      {
         _loc5_ = 100 - _loc3_[_loc2_].getHealth();
         if(_root.clinicBuilt == false)
         {
            _root.giveMedicineInfoBox.clinicLabel.text = _root.medHiCost;
            _loc4_ = 2;
         }
         else
         {
            _root.giveMedicineInfoBox.clinicLabel.text = _root.medLowCost;
            _loc4_ = 1;
         }
      }
      _loc6_ = _loc6_ + (100 - _loc3_[_loc2_].getHealth());
      _loc2_ = _loc2_ + 1;
   }
   _loc5_ = _loc5_ * _loc4_;
   _loc6_ = _loc6_ * _loc4_;
   _root.giveMedicineInfoBox.wholeFamilyCostLabel.text = "$ " + _loc6_;
   _root.giveMedicineInfoBox.costLabel.text = "$ " + _loc5_;
   _root.giveMedicineInfoBox.oneUnitCostLabel.text = "$ " + _loc4_;
   if(_root.farmModel.getMoney() >= _loc5_ && _loc5_ != 0)
   {
      _root.giveMedicineInfoBox.meFullyButton._visible = true;
   }
   else
   {
      _root.giveMedicineInfoBox.meFullyButton._visible = false;
   }
   if(_root.farmModel.getMoney() >= _loc6_ && _loc6_ != 0)
   {
      _root.giveMedicineInfoBox.wholeFamilyButton._visible = true;
   }
   else
   {
      _root.giveMedicineInfoBox.wholeFamilyButton._visible = false;
   }
   if(_root.farmModel.getMoney() >= _loc4_ && _loc5_ != 0)
   {
      _root.giveMedicineInfoBox.meOneUnitButton._visible = true;
   }
   else
   {
      _root.giveMedicineInfoBox.meOneUnitButton._visible = false;
   }
   _root.giveMedicineInfoBox._visible = true;
};
giveMedicineInfoBox.meFullyButton.onPress = function()
{
   var _loc4_ = _root.farmModel.getFamily();
   var _loc5_ = _root.whichFamilyMemberActive;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      if(_loc4_[_loc2_].getID() == _loc5_)
      {
         var _loc3_ = 100 - _loc4_[_loc2_].getHealth();
         if(!_root.clinicBuilt)
         {
            _loc3_ = _loc3_ * 2;
         }
         _root.farmModel.setMoney(_root.farmModel.getMoney() - _loc3_);
         _root.farmModel.setFamilyMemberHealth(_loc2_,100);
         _root.farmGraphicView.paint();
      }
      _loc2_ = _loc2_ + 1;
   }
   arrangeFamilyMemberInfoBox(_loc5_);
   familyMemberInfoBox.giveMedicineButton.onPress();
};
giveMedicineInfoBox.meOneUnitButton.onPress = function()
{
   var _loc4_ = _root.farmModel.getFamily();
   var _loc5_ = _root.whichFamilyMemberActive;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      if(_loc4_[_loc2_].getID() == _loc5_)
      {
         var _loc3_ = 1;
         if(!_root.clinicBuilt)
         {
            _loc3_ = 2;
         }
         _root.farmModel.setMoney(_root.farmModel.getMoney() - _loc3_);
         _root.farmModel.incrementFamilyMemberHealth(_loc2_);
         _root.farmGraphicView.paint();
      }
      _loc2_ = _loc2_ + 1;
   }
   arrangeFamilyMemberInfoBox(_loc5_);
   familyMemberInfoBox.giveMedicineButton.onPress();
};
giveMedicineInfoBox.wholeFamilyButton.onPress = function()
{
   var _loc3_ = _root.farmModel.getFamily();
   var _loc5_ = _root.whichFamilyMemberActive;
   var _loc4_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      _loc4_ = _loc4_ + (100 - _loc3_[_loc2_].getHealth());
      _root.farmModel.setFamilyMemberHealth(_loc2_,100);
      _loc2_ = _loc2_ + 1;
   }
   if(!_root.clinicBuilt)
   {
      _loc4_ = _loc4_ * 2;
   }
   _root.farmModel.setMoney(_root.farmModel.getMoney() - _loc4_);
   _root.farmGraphicView.paint();
   arrangeFamilyMemberInfoBox(_loc5_);
   familyMemberInfoBox.giveMedicineButton.onPress();
};
giveMedicineInfoBox.closeGiveMedicineInfoBoxButton.onPress = function()
{
   _root.giveMedicineInfoBox._visible = false;
};
familyMemberInfoBox.haveBabyButton.onPress = function()
{
   var _loc3_ = _root.farmModel.getFamily();
   var _loc6_ = _root.whichFamilyMemberActive;
   var _loc5_ = undefined;
   var _loc4_ = undefined;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_].getID() == _loc6_)
      {
         _loc4_ = _loc3_[_loc2_].getName() + " ";
         if(!_loc3_[_loc2_].getFertile())
         {
            if(_loc3_[_loc2_].getAge() < 15)
            {
               _loc5_ = _loc4_ + _root.bbIsTooYoung;
            }
            else if(_loc3_[_loc2_].getHealth() < 50)
            {
               _loc5_ = _loc4_ + _root.bbIsBadHealth;
            }
            else if(_loc3_[_loc2_].getAge() > 38)
            {
               _loc5_ = _loc4_ + _root.bbHasLostToAge;
            }
         }
         else if(farmModel.getFamilyMembers() > 7)
         {
            _loc5_ = _loc4_ + _root.bbIDontWant;
         }
         else
         {
            _loc5_ = _loc4_ + _root.bbIsNowPreg;
            _root.farmModel.setFamilyMemberPregnant(_loc2_,true);
         }
         arrangeFamilyMemberInfoBox(_loc6_);
         _root.haveBabyInfoBox.explanationLabel.text = _loc5_;
         _root.haveBabyInfoBox._visible = true;
      }
      _loc2_ = _loc2_ + 1;
   }
};
haveBabyInfoBox.closeBoxButton.onPress = function()
{
   haveBabyInfoBox._visible = false;
};
familyMemberInfoBox.goToSchoolButton.onPress = function()
{
   var _loc2_ = undefined;
   if(!_root.schoolBuilt)
   {
      _loc2_ = _root.noSchoolNearby;
      nPrice = _root.schoolFee;
   }
   else
   {
      _loc2_ = _root.schoolNearby;
      nPrice = Math.round(_root.schoolFee / 2);
   }
   goToSchoolInfoBox.explanationLabel.text = _loc2_;
   goToSchoolInfoBox.priceLabel.text = nPrice + " $";
   goToSchoolInfoBox._visible = true;
};
goToSchoolInfoBox.closeBoxButton.onPress = function()
{
   _root.goToSchoolInfoBox._visible = false;
};
goToSchoolInfoBox.acceptButton.onPress = function()
{
   var _loc5_ = false;
   if(_root.schoolBuilt)
   {
      if(farmModel.getMoney() >= Math.round(_root.schoolFee / 2))
      {
         farmModel.setMoney(farmModel.getMoney() - Math.round(_root.schoolFee / 2));
         _loc5_ = true;
      }
   }
   else if(farmModel.getMoney() >= _root.schoolFee)
   {
      farmModel.setMoney(farmModel.getMoney() - _root.schoolFee);
      _loc5_ = true;
   }
   if(_loc5_)
   {
      var _loc3_ = _root.farmModel.getFamily();
      var _loc4_ = _root.whichFamilyMemberActive;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc4_ == _loc3_[_loc2_].getID())
         {
            farmModel.setPersonAtSchool(_loc2_,true);
         }
         _loc2_ = _loc2_ + 1;
      }
      arrangeFamilyMemberInfoBox(_loc4_);
      farmGraphicView.paint();
      _root.totalSchoolCount = _root.totalSchoolCount + 1;
   }
};
familyMemberInfoBox.appointHeadOfFamilyButton.onPress = function()
{
   var _loc4_ = undefined;
   _loc4_ = _root.appoint1;
   var _loc5_ = _root.whichFamilyMemberActive;
   var _loc3_ = _root.farmModel.getFamily();
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc5_ == _loc3_[_loc2_].getID())
      {
         _loc4_ = _loc4_ + _loc3_[_loc2_].getName();
      }
      _loc2_ = _loc2_ + 1;
   }
   _loc4_ = _loc4_ + _root.appoint2;
   familyHeadInfoBox.explanationLabel.text = _loc4_;
   familyHeadInfoBox._visible = true;
};
familyHeadInfoBox.closeBoxButton.onPress = function()
{
   _root.familyHeadInfoBox._visible = false;
};
familyHeadInfoBox.acceptButton.onPress = function()
{
   var _loc5_ = _root.whichFamilyMemberActive;
   var _loc4_ = _root.farmModel.getFamily();
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      if(_loc4_[_loc2_].getID() == _loc5_)
      {
         _root.farmModel.setPersonFamilyHead(_loc2_);
         var _loc3_ = _loc4_[_loc2_].getMarriedTo();
         if(_loc3_ != -1)
         {
            _root.farmModel.family[_root.farmModel.getFamilyMemberById(_loc3_)].setSpouse(true);
         }
      }
      _loc2_ = _loc2_ + 1;
   }
   arrangeFamilyMemberInfoBox(_loc5_);
   _root.familyHeadInfoBox._visible = false;
};
familyMemberInfoBox.marryButton.onPress = function()
{
   var _loc6_ = _root.whichFamilyMemberActive;
   var _loc5_ = undefined;
   var _loc9_ = undefined;
   var _loc10_ = undefined;
   var _loc7_ = undefined;
   var _loc4_ = undefined;
   var _loc8_ = undefined;
   var _loc12_ = undefined;
   var _loc13_ = undefined;
   var _loc11_ = undefined;
   if(!_root.marriageThisYear && farmModel.getFamilyMembers() < 8)
   {
      var _loc3_ = _root.farmModel.getFamily();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].getID() == _loc6_)
         {
            _loc5_ = _loc3_[_loc2_].getEducationLvl();
            _loc9_ = _loc3_[_loc2_].getHealth();
            _loc10_ = _loc3_[_loc2_].getAge();
            _loc7_ = _loc3_[_loc2_].getGender();
            _loc4_ = _loc3_[_loc2_].getName();
            _loc8_ = _loc3_[_loc2_].getHeadOfFamily();
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc11_ = 45 - _loc10_ + 35 * _loc5_ + (_loc9_ * 3 - 150);
      if(_loc11_ < 1)
      {
         _loc11_ = 5;
      }
      _root.marriageProposalPrice = _loc11_;
      if(_loc7_)
      {
         _loc12_ = _loc4_ + _root.couldMarryWoman + _loc11_;
      }
      else
      {
         _loc12_ = _loc4_ + _root.couldMarryMan + _loc11_;
      }
      if(_loc8_)
      {
         _loc12_ = _loc12_ + _root.willMoveIn;
      }
      else
      {
         _loc12_ = _loc12_ + (". " + _loc4_ + _root.willMoveOut);
      }
      marriageInfoBox.acceptButton._visible = true;
      marriageInfoBox.declineButton._visible = true;
      marriageInfoBox.acceptLabel._visible = true;
   }
   else
   {
      _loc12_ = _root.noSpouseFound;
      marriageInfoBox.acceptButton._visible = false;
      marriageInfoBox.declineButton._visible = false;
      marriageInfoBox.acceptLabel._visible = false;
   }
   marriageInfoBox.explanationLabel.text = _loc12_;
   marriageInfoBox._visible = true;
};
marriageInfoBox.acceptButton.onPress = function()
{
   var _loc14_ = _root.whichFamilyMemberActive;
   var _loc5_ = _root.farmModel.getFamily();
   var _loc13_ = undefined;
   var _loc16_ = undefined;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_.length)
   {
      if(_loc5_[_loc2_].getID() == _loc14_)
      {
         _loc13_ = _loc5_[_loc2_].getHeadOfFamily();
         _loc16_ = _loc5_[_loc2_].getGender();
      }
      _loc2_ = _loc2_ + 1;
   }
   if(_loc13_)
   {
      if(_loc16_)
      {
         var _loc10_ = undefined;
         var _loc8_ = undefined;
         var _loc7_ = _root.farmModel.getFamily();
         var _loc4_ = 0;
         while(_loc4_ < _loc7_.length)
         {
            if(_loc7_[_loc4_].getHeadOfFamily())
            {
               _loc10_ = _loc7_[_loc4_].getAge();
               _loc8_ = _loc7_[_loc4_].getEducationLvl();
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc10_ = _loc10_ + (random(4) - 2);
         _loc8_ = _loc8_ + (random(4) - 2);
         if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         if(_loc10_ > 40)
         {
            _loc10_ = 29 + random(6);
         }
         _root.farmModel.addFamilyMember(new characters.Person(false,_loc10_,true));
         var _loc12_ = undefined;
         var _loc18_ = undefined;
         _loc5_ = _root.farmModel.getFamily();
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            if(_loc5_[_loc2_].getSpouse())
            {
               _loc12_ = _loc5_[_loc2_].getID();
            }
            else if(_loc5_[_loc2_].getHeadOfFamily())
            {
               _loc18_ = _loc5_[_loc2_].getID();
            }
            _loc2_ = _loc2_ + 1;
         }
         _root.farmModel.marryById(_loc18_,_loc12_);
         _root.farmModel.setPersonEducationLvl(_loc12_,_loc8_);
         _root.farmGraphicView.paint();
      }
      else
      {
         var _loc15_ = undefined;
         var _loc9_ = undefined;
         var _loc6_ = _root.farmModel.getFamily();
         var _loc3_ = 0;
         while(_loc3_ < _loc6_.length)
         {
            if(_loc6_[_loc3_].getHeadOfFamily())
            {
               _loc15_ = _loc6_[_loc3_].getAge() + random(5);
               _loc9_ = _loc6_[_loc3_].getEducationLvl();
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc9_ = _loc9_ + (random(4) - 2);
         if(_loc9_ < 0)
         {
            _loc9_ = 0;
         }
         _root.farmModel.addFamilyMember(new characters.Person(true,_loc15_,true));
         var _loc11_ = undefined;
         var _loc17_ = undefined;
         _loc5_ = _root.farmModel.getFamily();
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            if(_loc5_[_loc2_].getSpouse())
            {
               _loc11_ = _loc5_[_loc2_].getID();
            }
            else if(_loc5_[_loc2_].getHeadOfFamily())
            {
               _loc17_ = _loc5_[_loc2_].getID();
            }
            _loc2_ = _loc2_ + 1;
         }
         _root.farmModel.marryById(_loc17_,_loc11_);
         _root.farmModel.setPersonEducationLvl(_loc11_,_loc9_);
         _root.farmGraphicView.paint();
      }
   }
   else
   {
      _root.farmModel.removeOneFamilyMember(_root.farmModel.getFamilyMemberById(_root.whichFamilyMemberActive));
   }
   _root.farmModel.setMoney(_root.farmModel.getMoney() + _root.marriageProposalPrice);
   _root.newscore = _root.newscore + _root.marriagePointsAwarded;
   _root.familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   _root.farmGraphicView.paint();
   _root.marriageThisYear = true;
   _root.totalMarriageCount = _root.totalMarriageCount + 1;
};
marriageInfoBox.closeBoxButton.onPress = function()
{
   _root.marriageInfoBox._visible = false;
};
marriageInfoBox.declineButton.onPress = function()
{
   _root.marriageInfoBox._visible = false;
};
familyMemberInfoBox.leaveFarmButton.onPress = function()
{
   var _loc10_ = _root.whichFamilyMemberActive;
   var _loc3_ = _root.farmModel.getFamily();
   var _loc9_ = undefined;
   var _loc4_ = undefined;
   var _loc7_ = "";
   var _loc12_ = undefined;
   var _loc8_ = undefined;
   var _loc6_ = undefined;
   var _loc14_ = undefined;
   var _loc13_ = undefined;
   var _loc11_ = undefined;
   var _loc5_ = undefined;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_].getID() == _loc10_)
      {
         _loc9_ = _loc3_[_loc2_].getAge();
         _loc8_ = _loc3_[_loc2_].getEducationLvl();
         _loc4_ = _loc3_[_loc2_].getName();
         _loc12_ = _loc3_[_loc2_].getGender();
         _loc6_ = _loc3_[_loc2_].getHealth();
         _loc13_ = _loc3_[_loc2_].getPregnant();
      }
      _loc2_ = _loc2_ + 1;
   }
   if(_loc12_)
   {
      _loc14_ = _root.wordHim;
   }
   else
   {
      _loc14_ = _root.wordHer;
   }
   if(_loc9_ < 3)
   {
      _loc7_ = _loc4_ + _root.leaveFB1 + _loc14_ + _root.leaveFB2 + _loc14_ + _root.leaveFB3;
      _loc11_ = 0;
      _loc5_ = _root.leaveFarmBaby;
   }
   else if(_loc9_ < 18)
   {
      if(_loc8_ < 2)
      {
         _loc11_ = 0;
         _loc5_ = Math.round(_root.leaveFarmChildNoEd * _loc6_ / 100);
         _loc7_ = _loc4_ + _root.leaveFC1 + _loc14_ + _root.leaveFC2 + _loc5_ + _root.leaveFC3 + _loc4_ + _root.leaveFC4;
      }
      else
      {
         _loc11_ = 1;
         _loc5_ = Math.round(_root.leaveFarmChildEd * _loc6_ / 100);
         _loc7_ = _loc4_ + _root.leaveFCE1 + _loc5_ + _root.leaveFCE2 + _loc4_ + _root.leaveFCE3;
      }
   }
   else if(_loc8_ < 2)
   {
      _loc11_ = 2;
      _loc5_ = Math.round(_root.leaveFarmAdultNoEd * _loc6_ / 100);
      _loc7_ = _loc4_ + _root.leaveFA1 + _loc5_ + _root.leaveFA2 + _loc4_;
   }
   else if(_loc8_ < 6)
   {
      _loc11_ = 3;
      _loc5_ = Math.round(_root.leaveFarmAdultSomeEd * _loc6_ / 100);
      _loc7_ = _loc4_ + _root.leaveFAE1 + _loc5_ + _root.leaveFAE2;
   }
   else
   {
      _loc11_ = 5;
      _loc5_ = Math.round(_root.leaveFarmAdultHighEd * _loc6_ / 100);
      _loc7_ = _loc4_ + _root.leaveFAHE1 + _loc5_ + _root.leaveFAHE2;
   }
   if(_loc3_.length == 1)
   {
      _loc7_ = _loc7_ + _root.leaveFLast;
   }
   if(_loc13_)
   {
      _loc7_ = _loc4_ + _root.leaveFPreg;
      leaveFarmInfoBox.leaveButton._visible = false;
   }
   else
   {
      leaveFarmInfoBox.leaveButton._visible = true;
   }
   leaveFarmInfoBox.explanationLabel.text = _loc7_;
   _root.leaveFarmReward = _loc5_;
   _root.leaveFarmPointsAwarded = _loc11_;
   leaveFarmInfoBox._visible = true;
};
leaveFarmInfoBox.closeBoxButton.onPress = function()
{
   _root.leaveFarmInfoBox._visible = false;
};
leaveFarmInfoBox.stayButton.onPress = function()
{
   _root.leaveFarmInfoBox._visible = false;
};
leaveFarmInfoBox.leaveButton.onPress = function()
{
   _root.farmModel.removeOneFamilyMember(_root.farmModel.getFamilyMemberById(_root.whichFamilyMemberActive));
   _root.farmModel.setMoney(_root.farmModel.getMoney() + _root.leaveFarmReward);
   _root.newscore = _root.newscore + _root.leaveFarmPointsAwarded;
   _root.familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
   _root.farmGraphicView.paint();
   _root.marriageThisYear = true;
   if(_root.farmModel.getFamily().length < 1)
   {
      gotoAndStop("gameOver");
   }
};
familyMemberInfoBox.nameLabel.onChanged = function(textfield_txt)
{
   if(textfield_txt.text.length != 0)
   {
      if(textfield_txt.text != " ")
      {
         if(textfield_txt.text != "  ")
         {
            if(textfield_txt.text != "   ")
            {
               _root.farmModel.changePersonName(_root.farmModel.getFamilyMemberById(_root.whichFamilyMemberActive),textfield_txt.text);
            }
         }
      }
   }
};
playButton.onPress = function()
{
   if(cursorObject == undefined)
   {
      _root.popTxtOut();
      _root.sellInfoBox._visible = false;
      _root.familyMemberInfoBox.closeFamilyMemberInfoBoxButton.onPress();
      _root.projectInfoBox._visible = false;
      _root.playerActivity.push(activityCounter);
      _root.playerActivity.shift();
      _root.whoDiedFromLowHealth = farmModel.ageing();
      farmController.makeEvent();
      gotoAndStop("phase2-4");
      play();
      _root.timeAnimation.play();
      _root.turnCount = _root.turnCount + 1;
   }
};
makeOutline = function(tt)
{
   if(_root._currentframe != 40)
   {
      var _loc3_ = new flash.filters.GlowFilter(12303104,1,2,2,20,15,false,false);
      var _loc2_ = tt.filters;
      _loc2_.push(_loc3_);
      tt.filters = _loc2_;
   }
};
removeOutline = function(tt)
{
   tt.filters = new Array();
};
showProjectInfoBox = function(tt)
{
   var _loc2_ = undefined;
   switch(tt)
   {
      case "road":
         _loc2_ = _root.roadDesc;
         break;
      case "communicationsGraphic":
         _loc2_ = _root.comDesc;
         break;
      case "clinicGraphic":
         _loc2_ = _root.clinDesc;
         break;
      case "schoolGraphic":
         _loc2_ = _root.schoolDesc;
         break;
      case "representativeGraphic":
         _loc2_ = _root.repDesc;
         break;
      case "insuranceGraphic":
         _loc2_ = _root.insDesc;
   }
   _root.projectInfoBox.textField.text = _loc2_;
   _root.projectInfoBox._visible = true;
};
projectInfoBox.exitButton.onRelease = function()
{
   _root.projectInfoBox._visible = false;
};
road.onRollOver = function()
{
   makeOutline(road);
};
clinicGraphic.onRollOver = function()
{
   makeOutline(clinicGraphic);
};
communicationsGraphic.onRollOver = function()
{
   makeOutline(communicationsGraphic);
};
insuranceGraphic.onRollOver = function()
{
   makeOutline(insuranceGraphic);
};
schoolGraphic.onRollOver = function()
{
   makeOutline(schoolGraphic);
};
representativeGraphic.onRollOver = function()
{
   makeOutline(representativeGraphic);
};
road.onRollOut = function()
{
   removeOutline(road);
};
clinicGraphic.onRollOut = function()
{
   removeOutline(clinicGraphic);
};
communicationsGraphic.onRollOut = function()
{
   removeOutline(communicationsGraphic);
};
insuranceGraphic.onRollOut = function()
{
   removeOutline(insuranceGraphic);
};
schoolGraphic.onRollOut = function()
{
   removeOutline(schoolGraphic);
};
representativeGraphic.onRollOut = function()
{
   removeOutline(representativeGraphic);
};
road.onRelease = function()
{
   showProjectInfoBox("road");
};
clinicGraphic.onRelease = function()
{
   showProjectInfoBox("clinicGraphic");
};
communicationsGraphic.onRelease = function()
{
   showProjectInfoBox("communicationsGraphic");
};
insuranceGraphic.onRelease = function()
{
   showProjectInfoBox("insuranceGraphic");
};
schoolGraphic.onRelease = function()
{
   showProjectInfoBox("schoolGraphic");
};
representativeGraphic.onRelease = function()
{
   showProjectInfoBox("representativeGraphic");
};
sellInfoBox.sellShovelButton.onPress = function()
{
   _root.sellShovelAvail = _root.sellShovelAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellShovelPrice);
   farmModel.removeOneInvestment("shovel");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellChickenButton.onPress = function()
{
   _root.sellChickenAvail = _root.sellChickenAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellChickenPrice);
   farmModel.removeOneInvestment("chicken");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellPigButton.onPress = function()
{
   _root.sellPigAvail = _root.sellPigAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellPigPrice);
   farmModel.removeOneInvestment("pig");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellCowButton.onPress = function()
{
   _root.sellCowAvail = _root.sellCowAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellCowPrice);
   farmModel.removeOneInvestment("cow");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellElephantButton.onPress = function()
{
   _root.sellElephantAvail = _root.sellElephantAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellElephantPrice);
   farmModel.removeOneInvestment("elephant");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellScytheButton.onPress = function()
{
   _root.sellScytheAvail = _root.sellScytheAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellScythePrice);
   farmModel.removeOneInvestment("scythe");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellPlowButton.onPress = function()
{
   _root.sellPlowAvail = _root.sellPlowAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellPlowPrice);
   farmModel.removeOneInvestment("plow");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellTractorButton.onPress = function()
{
   _root.sellTractorAvail = _root.sellTractorAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellTractorPrice);
   farmModel.removeOneInvestment("tractor");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellHarvesterButton.onPress = function()
{
   _root.sellHarvesterAvail = _root.sellHarvesterAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellHarvesterPrice);
   farmModel.removeOneInvestment("harvester");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellShedButton.onPress = function()
{
   _root.sellShedAvail = _root.sellShedAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellShedPrice);
   farmModel.removeOneInvestment("shed");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellWellButton.onPress = function()
{
   _root.sellWellAvail = _root.sellWellAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellWellPrice);
   farmModel.removeOneInvestment("well");
   updateSellInfoBox();
   farmGraphicView.paint();
};
sellInfoBox.sellBarnButton.onPress = function()
{
   _root.sellBarnAvail = _root.sellBarnAvail - 1;
   farmModel.setMoney(farmModel.getMoney() + _root.sellBarnPrice);
   farmModel.removeOneInvestment("barn");
   updateSellInfoBox();
   farmGraphicView.paint();
};
