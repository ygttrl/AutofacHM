using Business.Abstruct;
using Core.Utilities.Result;
using DataAccess.Abstruct;
using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class CustomerManager : ICustomerService
    {
        ICustomerDal _customerDal;

        public CustomerManager(ICustomerDal customerDal)
        {
            _customerDal = customerDal;
        }

        public IResult Add(Customer customer)
        {
            if (customer==null)
            {
                return new ErrorResult("Müşteri Eklerken hata oluştu.");
            }
            _customerDal.Add(customer);
            return new SuccessResult("Müşteri Ekleme Başarılı.");
        }
        public IResult Delete(Customer customer)
        {
            if (customer==null)
            {
                return new ErrorResult("Müşteri Silme Başarısız.");
            }
            _customerDal.Delete(customer);
            return new SuccessResult("Müşteri Silme Başarılı.");
        }

        public IResult Update(Customer Customer)
        {
            if (Customer==null)
            {
                return new ErrorResult("Müşteri Update Başarısız.");
            }
            _customerDal.Update(Customer);
            return new SuccessResult("Müşteri Update Başarılı.");
        }

        public IDataResult<Customer> Get(int customerId)
        {
            if (customerId<=0)
            {
                return new ErrorDataResult<Customer>("Müşteri Getirme işlemi başarısız.");
            }
            return new SuccessDataResult<Customer>(_customerDal.Get(x=> x.Id== customerId), "Müşteri Getirme işlemi Başarılı.");
        }

        public IDataResult<List<Customer>> GetAll(int customerId)
        {
            if (customerId<=0)
            {
                return new ErrorDataResult<List<Customer>>("Müşteri Listeleme Başarısız.");
            }
            return new SuccessDataResult<List<Customer>>(_customerDal.GetAll(x => x.Id == customerId), "Müşteri Listeleme Başarılı.");
        }

        public IDataResult<List<Customer>> GetAll()
        {
            return new SuccessDataResult<List<Customer>>(_customerDal.GetAll(), "Müşteri Listeleme Başarılı.");
        }

       
    }
}
