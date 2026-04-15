using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace hospital
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form agendarcita = new Form3();
            agendarcita.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form generarturno = new Form4();
            generarturno.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form menu = new Form2();
            menu.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
