using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Peacock.ManageWeb
{
    public class BaseIdentityService
    {
        private static HashAlgorithm _encrypter = MD5.Create();

        public static string HashPassword(string text)
        {
            return HashString(_encrypter.ComputeHash(Encoding.UTF8.GetBytes(text + string.Empty)));
        }

        private static string HashString(byte[] hashed)
        {
            return Convert.ToBase64String(hashed);
        }
    }
}
