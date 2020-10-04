class mvcFarm.FarmModel extends obs.Observable
{
   function FarmModel()
   {
      super();
      this.money = _root.startMoney;
      this.familyMembers = 0;
      this.investments = new Array();
      this.family = new Array();
   }
   function init()
   {
      this.money = _root.startMoney;
      this.familyMembers = 0;
      this.investments = new Array();
      this.family = new Array();
      this.addFamilyMember(new characters.Person(true,28,false));
      this.addFamilyMember(new characters.Person(false,25,true));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(false,6,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,8,false));
      this.addFamilyMember(new characters.Person(true,999,false));
      this.family[0].setHeadOfFamily(true);
      this.family[0].setMarriedTo(this.family[1].getID());
      this.family[1].setMarriedTo(this.family[0].getID());
   }
   static function getModel()
   {
      if(mvcFarm.FarmModel.instance == null)
      {
         mvcFarm.FarmModel.instance = new mvcFarm.FarmModel();
      }
      return mvcFarm.FarmModel.instance;
   }
   function getInvestments()
   {
      return this.investments;
   }
   function getMoney()
   {
      return this.money;
   }
   function setMoney(money)
   {
      this.money = money;
      this.notify();
   }
   function getFamily()
   {
      return this.family;
   }
   function getFamilyMembers()
   {
      return this.familyMembers;
   }
   function setFamilyMembers(familyMembers)
   {
      this.familyMembers = familyMembers;
      this.family = this.family.slice(0,familyMembers);
   }
   function setFamilyMemberHealth(index, health)
   {
      this.family[index].setHealth(health);
      this.notify();
   }
   function incrementFamilyMemberHealth(index)
   {
      this.family[index].setHealth(this.family[index].getHealth() + 1);
      this.notify();
   }
   function setFamilyMemberPregnant(index, p)
   {
      this.family[index].setPregnant(p);
      this.notify();
   }
   function setPersonAtSchool(index, as)
   {
      this.family[index].setAtSchool(as);
      this.family[index].calculateWorkEfficiency();
      this.notify();
   }
   function changePersonName(index, newname)
   {
      this.family[index].setName(newname);
      this.notify();
   }
   function notify()
   {
      var _loc2_ = new mvcFarm.FarmInfo(this.money,this.familyMembers,this.investments,this.family);
      this.notifyObservers(_loc2_);
   }
   function addInvestment(investment)
   {
      this.investments.splice(0,0,investment);
      if(investment.getPrice() == 0)
      {
         _root[investment.getLinkageName() + "Amount"] = _root[investment.getLinkageName() + "Amount"] - 1;
         _root.updateButtons();
      }
      else
      {
         this.money = this.money + investment.getPrice();
      }
      this.notify();
   }
   function removeInvestment(investment)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         if(this.investments[_loc2_] == investment)
         {
            this.investments.splice(_loc2_,1);
         }
         this.notify();
         _loc2_ = _loc2_ + 1;
      }
   }
   function removeOneFamilyMember(familyMemberId)
   {
      var _loc2_ = this.family[familyMemberId].getMarriedTo();
      if(_loc2_ != -1)
      {
         this.family[this.getFamilyMemberById(_loc2_)].setMarriedTo(-1);
         this.family[this.getFamilyMemberById(_loc2_)].setSpouse(false);
      }
      this.family.splice(familyMemberId,1);
      this.familyMembers = this.familyMembers - 1;
      this.checkForFamilyHead();
      this.notify();
   }
   function removeOneFamilyMemberById(familyMemberId)
   {
      var _loc2_ = this.family[this.getFamilyMemberById(familyMemberId)].getMarriedTo();
      if(_loc2_ != -1)
      {
         this.family[this.getFamilyMemberById(_loc2_)].setMarriedTo(-1);
         this.family[this.getFamilyMemberById(_loc2_)].setSpouse(false);
      }
      this.family.splice(this.getFamilyMemberById(familyMemberId),1);
      this.familyMembers = this.familyMembers - 1;
      this.checkForFamilyHead();
      this.notify();
   }
   function addFamilyMember(person)
   {
      this.family.push(person);
      this.setFamilyMembers(this.getFamilyMembers() + 1);
      this.notify();
   }
   function getFamilyMemberById(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.family.length)
      {
         if(this.family[_loc2_].getID() == id)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setPersonEducationLvl(index, education)
   {
      this.family[this.getFamilyMemberById(index)].setEducationLvl(education);
   }
   function marryById(firstperson, secondperson)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.family.length)
      {
         if(this.family[_loc2_].getID() == firstperson)
         {
            this.family[_loc2_].setMarriedTo(secondperson);
         }
         else if(this.family[_loc2_].getID() == secondperson)
         {
            this.family[_loc2_].setMarriedTo(firstperson);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function removeOneInvestment(investmentType)
   {
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         if(this.investments[_loc2_].getLinkageName() == investmentType && _loc3_ == false)
         {
            this.investments[_loc2_].getPositionMC().enabled = true;
            this.investments.splice(_loc2_,1);
            _loc3_ = true;
         }
         this.notify();
         _loc2_ = _loc2_ + 1;
      }
   }
   function clearinvestments()
   {
      this.investments = new Array();
      this.notify();
   }
   function clearInvestmentsRandomly()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         if(this.investments[_loc2_].getLinkageName() != "well" && random(100) < 75)
         {
            this.investments.splice(_loc2_,1);
         }
         this.notify();
         _loc2_ = _loc2_ + 1;
      }
   }
   function getInvestmentsLength()
   {
      return this.investments.length;
   }
   function getInvestmentsValue()
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         _loc3_ = _loc3_ + this.investments[_loc2_].getPrice();
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function handle_event(investment)
   {
      if(investment == "mob")
      {
         this.clearinvestments();
         _root.playerActivity.push(4);
         _root.playerActivity.shift();
      }
      else if(investment == "money")
      {
         this.clearInvestmentsRandomly();
      }
      else if(investment != "Good")
      {
         if(investment != "veryGood")
         {
            if(investment != "marketprices")
            {
               if(investment != "nationalbank")
               {
                  if(investment != "sickness")
                  {
                     if(investment == "civilwar")
                     {
                        this.clearInvestmentsRandomly();
                     }
                     else if(investment == "guerillas")
                     {
                        if(!_root.representativeBuilt)
                        {
                           this.removeInvestmentType("Livestock",false);
                           this.removeInvestmentType("tractor",false);
                           this.removeInvestmentType("harvester",false);
                           this.setMoney(0);
                        }
                     }
                     else if(investment == "fire")
                     {
                        this.removeInvestmentType("shed",false);
                        this.removeInvestmentType("barn",false);
                     }
                     else if(investment == "wellscavein")
                     {
                        this.removeInvestmentType("well",false);
                     }
                     else if(investment == "corrupt")
                     {
                        if(!_root.representativeBuilt)
                        {
                           this.setMoney(0);
                        }
                     }
                     else if(investment == "theft")
                     {
                        this.removeInvestmentType("shovel",false);
                        this.removeInvestmentType("scythe",false);
                     }
                     else if(investment == "cow" || investment == "pig" || investment == "chicken" || investment == "elephant" || investment == "Livestock")
                     {
                        this.removeInvestmentType(investment,false);
                     }
                     else if(investment == "corn" || investment == "wheat" || investment == "cotton" || investment == "peanut")
                     {
                        if(!_root.insuranceBuilt)
                        {
                           this.removeInvestmentType(investment,false);
                        }
                     }
                     else if(investment == "Crop")
                     {
                        if(!_root.insuranceBuilt)
                        {
                           this.removeInvestmentType(investment,true);
                        }
                     }
                  }
               }
            }
         }
      }
      this.calculate(investment);
      this.notify();
   }
   function removeInvestmentType(investmentType, checkForWellFirst)
   {
      var _loc5_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         if(this.investments[_loc2_].getCategoryName() == investmentType || this.investments[_loc2_].getLinkageName() == investmentType)
         {
            if(investmentType == "Crop" && checkForWellFirst)
            {
               var _loc4_ = this.checkInvestment("well");
               if(_loc4_)
               {
                  if(_loc5_ == false)
                  {
                     _loc5_ = true;
                  }
                  else if(random(10) % 2 == 1)
                  {
                     this.removeInvestment(this.investments[_loc2_]);
                     _loc2_ = _loc2_ - 1;
                  }
               }
               else
               {
                  this.removeInvestment(this.investments[_loc2_]);
                  _loc2_ = _loc2_ - 1;
               }
            }
            else
            {
               this.removeInvestment(this.investments[_loc2_]);
               _loc2_ = _loc2_ - 1;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function checkInvestmentCount(investment)
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         if(this.investments[_loc2_].getLinkageName() == investment)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function checkInvestment(investment)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.investments.length)
      {
         if(this.investments[_loc2_].getLinkageName() == investment)
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function calculate(investment)
   {
      _root.IOcornAmount = 0;
      _root.IOwheatAmount = 0;
      _root.IOcottonAmount = 0;
      _root.IOpeanutAmount = 0;
      _root.IOpoppyAmount = 0;
      _root.IOchickenAmount = 0;
      _root.IOpigAmount = 0;
      _root.IOcowAmount = 0;
      _root.IOelephantAmount = 0;
      _root.IOcornYield = 0;
      _root.IOwheatYield = 0;
      _root.IOcottonYield = 0;
      _root.IOpeanutYield = 0;
      _root.IOpoppyYield = 0;
      _root.IOchickenYield = 0;
      _root.IOpigYield = 0;
      _root.IOcowYield = 0;
      _root.IOelephantYield = 0;
      var _loc6_ = this.getFamily();
      var _loc13_ = 0;
      var _loc15_ = false;
      var _loc16_ = investment != "sickness"?false:true;
      var _loc17_ = random(_loc6_.length) + 1;
      var _loc3_ = 0;
      while(_loc3_ < _loc6_.length)
      {
         if(_loc16_ && _loc3_ == _loc17_)
         {
            _loc6_[_loc3_].setHealth(random(10) + 1);
         }
         _loc13_ = _loc13_ + _loc6_[_loc3_].getWorkEfficiency();
         if(_loc6_[_loc3_].getPregnant())
         {
            _loc15_ = true;
            this.family[_loc3_].setPregnant(false);
         }
         _loc3_ = _loc3_ + 1;
      }
      _root.IOworkload = _loc13_ + "%";
      var _loc9_ = 0;
      var _loc10_ = 0;
      var _loc11_ = 1;
      var _loc12_ = 1;
      var _loc7_ = !(investment == "nationalbank" || investment == "marketprices")?false:true;
      _loc3_ = 0;
      while(_loc3_ < this.investments.length)
      {
         var _loc8_ = this.investments[_loc3_].getCategoryName();
         switch(_loc8_)
         {
            case "Crop":
               if(_loc7_)
               {
                  _loc9_ = _loc9_ + Math.round(this.investments[_loc3_].getMultiplier() / 3);
               }
               else
               {
                  _loc9_ = _loc9_ + this.investments[_loc3_].getMultiplier();
               }
               break;
            case "Livestock":
               if(_loc7_)
               {
                  _loc10_ = _loc10_ + Math.round(this.investments[_loc3_].getMultiplier() / 3);
               }
               else
               {
                  _loc10_ = _loc10_ + this.investments[_loc3_].getMultiplier();
               }
               break;
            case "Tool":
               _loc11_ = _loc11_ + this.investments[_loc3_].getMultiplier();
               break;
            case "Construction":
               _loc12_ = _loc12_ + this.investments[_loc3_].getMultiplier();
         }
         var _loc5_ = this.investments[_loc3_].getLinkageName();
         _root["IO" + _loc5_ + "Amount"]++;
         if(_loc7_)
         {
            _root["IO" + _loc5_ + "Yield"] = Math.round(this.investments[_loc3_].getMultiplier() / 3);
         }
         else
         {
            _root["IO" + _loc5_ + "Yield"] = this.investments[_loc3_].getMultiplier();
         }
         _loc3_ = _loc3_ + 1;
      }
      _root.IOtoolsBonus = "+ " + (_loc11_ - 1) * 100 + "%";
      _root.IObuildingBonus = "+ " + (_loc12_ - 1) * 100 + "%";
      _root.IOcropsTotal = Math.round(_loc9_ * _loc11_);
      _root.IOlivestockTotal = Math.round(_loc10_ * _loc12_);
      _root.IOsum = _root.IOcropsTotal + _root.IOlivestockTotal;
      _root.IOeventModifierNumber = 0;
      var _loc18_ = Math.round(_loc9_ * _loc11_ + _loc10_ * _loc12_);
      if(investment == "Good")
      {
         _root.IOeventModifierNumber = 50;
      }
      else if(investment == "veryGood")
      {
         _root.IOeventModifierNumber = 100;
      }
      _loc18_ = Math.round(_loc18_ * ((_loc13_ + _root.IOeventModifierNumber) / 100));
      _root.IOtotal = _loc18_;
      if(investment != "mob")
      {
         if(investment == "money")
         {
            if(this.getMoney() > 0)
            {
               _root.annualExpences = _root.annualExpences + random(this.getMoney());
            }
         }
         else if(investment == "sickness")
         {
            if(this.getMoney() > 0)
            {
               _root.annualExpences = _root.annualExpences + random(this.getMoney());
            }
         }
         else if(investment == "nationalbank")
         {
            if(this.getMoney() > 0)
            {
               _root.annualExpences = _root.annualExpences + random(this.getMoney());
            }
         }
         else if(investment == "civilwar")
         {
            if(this.getMoney() > 0)
            {
               _root.annualExpences = _root.annualExpences + random(this.getMoney());
            }
         }
      }
      _root.IOeventModifier = _root.IOeventModifierNumber + "%";
      var _loc19_ = (_loc13_ + _root.IOeventModifierNumber) / 100;
      _root.IOcalcString = "<b>" + _root.iobIncT + "\n(" + _root.IOsum + " x " + _loc19_ + "):</b>";
      _root.IOsavedfromlastyear = this.getMoney();
      if(_root.insuranceBuilt)
      {
         _root.annualExpences = _root.annualExpences + 20;
      }
      _root.IOlivingCosts = _root.annualExpences;
      if(_loc15_)
      {
         var _loc20_ = Math.round(random(10) % 2) == 0;
         this.addFamilyMember(new characters.Person(_loc20_,0,false));
         _root.childBornThisYear = true;
         _root.totalBabyCount = _root.totalBabyCount + 1;
      }
      this.setMoney(this.getMoney() + _loc18_ - _root.annualExpences);
      _root.IOtotalFinal = this.getMoney();
      _root.currentRevenue = _loc18_;
      if(this.getMoney() < _root.minMoney)
      {
         var _loc4_ = 0;
         while(_loc4_ < this.family.length)
         {
            this.family[_loc4_].setHealth(this.family[_loc4_].getHealth() - (10 + random(20)));
            if(this.family[_loc4_].getHealth() < 1)
            {
               this.family[_loc4_].setHealth(1);
            }
            _loc4_ = _loc4_ + 1;
         }
         _root.starvation = true;
      }
      if(_root.longTimeEffectChemical && this.getFamilyMembers() > 0 && random(3) > 1)
      {
         this.removeOneFamilyMember(random(this.family.length));
         _root.effectAffectuatedChemical = true;
      }
      _root.longTimeEffectChemical = false;
      if(_root.longTimeEffectOpium && this.getFamilyMembers() > 0 && random(3) > 1 && _root.farmModel.checkInvestment("poppy"))
      {
         this.removeOneFamilyMember(random(this.family.length));
         _root.effectAffectuatedOpium = true;
      }
      _root.longTimeEffectOpium = false;
      if(_root.longTimeEffectParamilitary && this.getFamilyMembers() > 0 && random(3) > 1)
      {
         this.removeOneFamilyMember(random(this.family.length));
         _root.effectAffectuatedParamilitary = true;
      }
      _root.longTimeEffectParamilitary = false;
      this.notify();
      this.removeInvestmentType("Crop",false);
   }
   function ageing()
   {
      var _loc9_ = new Array();
      var _loc10_ = new Array();
      var _loc6_ = undefined;
      var _loc8_ = 0;
      while(_loc8_ < this.family.length)
      {
         var _loc3_ = this.family[_loc8_];
         _loc3_.setAge(_loc3_.getAge() + 1);
         var _loc4_ = _loc3_.getAge();
         _loc3_.setHealth(_loc3_.getHealth() - random(Math.round(_loc4_ / 2)));
         if(_loc4_ > 50)
         {
            if(random(300) < _loc4_)
            {
               _loc3_.setHealth(0);
            }
         }
         if(_loc3_.getAtSchool())
         {
            _loc3_.increaseEducationLvl();
         }
         _loc3_.calculateWorkEfficiency();
         if(_loc3_.getHealth() > 0)
         {
            if(_loc4_ == 15)
            {
               _loc3_.setFertile(true);
            }
            if(!_loc3_.getGender())
            {
               if(_loc4_ > 38)
               {
                  if(random(100) < 70)
                  {
                     _loc3_.setFertile(false);
                  }
               }
               if(_loc4_ > 60)
               {
                  _loc3_.setFertile(false);
               }
            }
            else if(_loc3_.getGender())
            {
               if(_loc4_ > 50)
               {
                  if(random(100) < 15)
                  {
                     _loc3_.setFertile(false);
                  }
               }
            }
         }
         else
         {
            _loc6_ = _loc3_.getName();
            _loc10_.push(_loc3_.getID());
            _loc9_.push(_loc6_);
         }
         _loc8_ = _loc8_ + 1;
      }
      if(_loc9_.length > 0)
      {
         if(_loc9_.length == 1)
         {
            _loc6_ = _loc9_[0] + _root.sum5 + _root.sum4;
         }
         else
         {
            _loc6_ = "";
            var _loc5_ = 0;
            while(_loc5_ < _loc9_.length)
            {
               _loc6_ = _loc6_ + _loc9_[_loc5_];
               if(_loc5_ != _loc9_.length - 1)
               {
                  _loc6_ = _loc6_ + _root.sum7;
               }
               _loc5_ = _loc5_ + 1;
            }
            _loc6_ = _loc6_ + (_root.sum6 + _root.sum4);
         }
      }
      else
      {
         _loc6_ = "";
      }
      if(_loc10_.length > 0)
      {
         var _loc7_ = 0;
         while(_loc7_ < _loc10_.length)
         {
            this.removeOneFamilyMemberById(_loc10_[_loc7_]);
            _loc7_ = _loc7_ + 1;
         }
         this.checkForFamilyHead();
      }
      return _loc6_;
   }
   function checkForFamilyHead()
   {
      var _loc5_ = false;
      var _loc3_ = 0;
      while(_loc3_ < this.family.length)
      {
         if(this.family[_loc3_].getHeadOfFamily())
         {
            _loc5_ = true;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(!_loc5_)
      {
         var _loc4_ = -1;
         var _loc6_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < this.family.length)
         {
            if(this.family[_loc2_].getAge() < _loc4_)
            {
               _loc4_ = this.family[_loc2_].getAge();
               _loc6_ = _loc2_;
            }
            if(this.family[_loc2_].getSpouse())
            {
               this.family[_loc2_].setSpouse(false);
            }
            _loc2_ = _loc2_ + 1;
         }
         this.family[_loc6_].setHeadOfFamily(true);
      }
   }
   function updateWorkEfficiency()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.family.length)
      {
         this.family[_loc2_].calculateWorkEfficiency();
         _loc2_ = _loc2_ + 1;
      }
   }
   function setPersonFamilyHead(index)
   {
      var _loc3_ = this.family[index].getSpouse();
      var _loc2_ = 0;
      while(_loc2_ < this.family.length)
      {
         if(_loc3_ && this.family[_loc2_].getHeadOfFamily())
         {
            this.family[_loc2_].setSpouse(true);
         }
         else
         {
            this.family[_loc2_].setSpouse(false);
         }
         this.family[_loc2_].setHeadOfFamily(false);
         _loc2_ = _loc2_ + 1;
      }
      this.family[index].setHeadOfFamily(true);
   }
   function toString()
   {
      return this.investments.toString();
   }
}
