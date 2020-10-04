class investments.Cow extends investments.Livestock
{
   function Cow()
   {
      super();
      this.setLinkageName("cow");
      this.setPrice(_root.cowPrice);
      this.setMultiplier(_root.cowMultiplier);
   }
   function toString()
   {
      return "One cow investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
