using System;

namespace BookRegistry
{
    class Program
    {
        static void Main(string[] args)
        {
            Book newbook1 = new Book("Jim's Story", "Jim Jimmy", 4503);
            Book newbook2 = new Book("Jam's Yrots", "Jam Jammy", 3054);


            Console.WriteLine(newbook1.pages);

            Console.ReadLine();
        }
    }
}
