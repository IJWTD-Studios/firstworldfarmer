class investments.Shed extends investments.Construction
{
   function Shed()
   {
      super();
      this.setLinkageName("shed");
      this.setPrice(_root.shedPrice);
      this.setMultiplier(_root.shedMultiplier);
   }
   function toString()
   {
      return "One shed investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
