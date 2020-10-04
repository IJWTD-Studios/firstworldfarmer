class mvcFarm.FarmTraceView extends mvc.AbstractView
{
   function FarmTraceView(m, c)
   {
      super(m,c);
   }
   function update(o, infoObj)
   {
      this.info = (mvcFarm.FarmInfo)infoObj;
   }
   function paint()
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.info.getInvestments().length)
      {
         if(this.info.getInvestments()[_loc2_].getLinkageName() == "corn")
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return "Investments: " + this.info.getInvestments() + "Corn investments: " + _loc3_ + "\nMoney: " + this.info.getMoney() + "\nFamily members: " + this.info.getFamilyMembers();
   }
}
