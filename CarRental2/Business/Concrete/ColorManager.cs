using Business.Abstruct;
using Business.Constants;
using Core.Utilities.Result;
using DataAccess.Abstruct;
using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class ColorManager : IColorService
    {
        IColorDal _colorDal;

        public ColorManager(IColorDal colorDal)
        {
            _colorDal = colorDal;
        }

        public IResult Add(Color color)
        {
            if (color==null)
            {
                return new ErrorResult(Message.ErrorMasage);
            }
            _colorDal.Add(color);
            return new SuccessResult(Message.SuccesMassage);
        }

        public IResult Delete(Color color)
        {

            if (color==null)
            {
                return new ErrorResult(Message.ErrorMasage);
            }
            _colorDal.Delete(color);

            return new SuccessResult(Message.SuccesMassage);
        }

        public IResult Update(Color color)
        {
            if (color==null)
            {
                return new ErrorResult(Message.ErrorMasage);
            }
            _colorDal.Update(color);
            return new SuccessResult(Message.SuccesMassage);
        }

        public IDataResult<Color> Get(int id)
        {
            if (id<=0)
            {
                return new ErrorDataResult<Color>(Message.ErrorMasage);
            }
            return new SuccessDataResult<Color>(_colorDal.Get(x => x.Id == id),Message.SuccesMassage);
        }

        public IDataResult<List<Color>> GetAll(int colorId)
        {
            if (colorId<=0)
            {
                return new ErrorDataResult<List<Color>>(Message.ErrorMasage);
            }
            return new SuccessDataResult<List<Color>>(_colorDal.GetAll(x => x.Id == colorId),Message.SuccesMassage);
        }

        public IDataResult<List<Color>> GetAll()
        {
            return new SuccessDataResult<List<Color>>(_colorDal.GetAll(),Message.SuccesMassage);
        }

       
    }
}
