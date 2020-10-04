class investments.Poppy extends investments.Crop
{
   function Poppy()
   {
      super();
      this.setLinkageName("poppy");
      this.setPrice(_root.poppyPrice);
      this.setAmount(_root.poppyAmount);
      this.setMultiplier(_root.poppyMultiplier);
   }
   function toString()
   {
      return "One poppy investment, positionMC = " + this.getPositionMC() + " linkage: " + this.getLinkageName() + " Price: " + this.getPrice() + "$";
   }
}
