class investments.Infrastructure extends investments.Project
{
   function Infrastructure()
   {
      super();
      this.setLinkageName("infrastructure");
      this.setPrice(_root.infrastructurePrice);
      this.setMultiplier(_root.infrastructureMultiplier);
   }
   function toString()
   {
      return "One infrastructure investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
