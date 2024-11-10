using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfApp1.DB;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;
using System.Threading;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Page
    {

        public Login()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string usernameOrEmail = UsernameOrEmailTextBox.Text;
            string password = PasswordBox.Password;
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == usernameOrEmail);


            if (user != null && VerifyPassword(user, password))
            {
                MessageBox.Show("Успешный вход!");
                NavigationService.Navigate(new Menu(user.Balance, user.Username));
            }
            else
            {
                MessageBox.Show("Неверные данные для входа.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool VerifyPassword(DB.User user, string password)
        {
            return user.PassHash == HashPassword(password);
        }
        public string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Reg());
        }
    }
}
