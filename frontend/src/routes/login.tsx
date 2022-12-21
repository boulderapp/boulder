import DefaultLayout from "../components/layouts/default";
import BaseButton from "../components/buttons/BaseButton";

function Login() {
  return (
    <DefaultLayout>
      <div className="text-boulder-beige grid grid-cols-2 px-12 justify-center items-center  border-boulder-beige border-4 h-[40rem] xl:w-[75vw] lg:w-[40vw]">
        <h1 className="col-start-1 mx-auto font-serif text-8xl">Login </h1>
        <div className="w-full col-start-2 border-2 border-black h-3/4 bg-boulder-beige">
          <form
            action="signin"
            className="relative grid w-full px-12 py-6 grid-row gap-y-3"
          >
            <label
              htmlFor="email"
              className="my-3 font-serif text-3xl text-boulder-brown"
            >
              email address
            </label>
            <input
              type="text"
              className="w-full border-b-2 appearance-none border-boulder-brown bg-boulder-beige text-boulder-brown"
            />

            <label
              htmlFor="password"
              className="my-3 mt-12 font-serif text-3xl text-boulder-brown"
            >
              password
            </label>
            <input
              type="text"
              className="w-full mb-12 border-b-2 appearance-none border-boulder-brown bg-boulder-beige text-boulder-brown"
            />
            <button className="bg-boulder-blue after:content-['\ '] after:w-full after:bg-boulder-blue after:absolute after:top-3 text-boulder-brown border-boulder-brown text-xl pl-4 border-2 text-start p-1">
              login
            </button>
            <button className="p-1 pl-4 text-xl border-2 bg-boulder-orange text-boulder-brown border-boulder-brown text-start">
              recover account
            </button>
            <BaseButton onClick={()=>{}} color="bg-boulder-orange" children="how u doing`"/>
          </form>
        </div>
      </div>
    </DefaultLayout>
  );
}

export default Login;
