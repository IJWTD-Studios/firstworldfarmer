class investments.Pig extends investments.Livestock
{
   function Pig()
   {
      super();
      this.setLinkageName("pig");
      this.setPrice(_root.pigPrice);
      this.setMultiplier(_root.pigMultiplier);
   }
   function toString()
   {
      return "One pig investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
