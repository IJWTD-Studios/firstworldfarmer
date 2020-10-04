class investments.Tractor extends investments.Tool
{
   function Tractor()
   {
      super();
      this.setLinkageName("tractor");
      this.setPrice(_root.tractorPrice);
      this.setMultiplier(_root.tractorMultiplier);
   }
   function toString()
   {
      return "One Tractor investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
