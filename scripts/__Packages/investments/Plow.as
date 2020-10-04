class investments.Plow extends investments.Tool
{
   function Plow()
   {
      super();
      this.setLinkageName("plow");
      this.setPrice(_root.plowPrice);
      this.setMultiplier(_root.plowMultiplier);
   }
   function toString()
   {
      return "One plow investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
