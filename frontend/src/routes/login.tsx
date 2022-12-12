import DefaultLayout from "../components/layouts/default";

function Login() {
  return (
    <DefaultLayout>
      <div className="text-boulder-beige grid grid-cols-2 px-12 justify-center items-center  border-boulder-beige border-4 h-[40rem] w-[40vw]">
        <h1 className="text-8xl font-serif mx-auto col-start-1">Login </h1>
        <div className="h-3/4 border-black border-2 bg-boulder-beige w-full  col-start-2">
          <form
            action="signin"
            className="grid grid-row w-full gap-y-3 py-6 px-12 relative"
          >
            <label
              htmlFor="email"
              className="text-3xl font-serif text-boulder-brown my-3"
            >
              email address
            </label>
            <input
              type="text"
              className="appearance-none border-b-2 border-boulder-brown 
               bg-boulder-beige text-boulder-brown w-full"
            />

            <label
              htmlFor="password"
              className="text-3xl  font-serif text-boulder-brown my-3 mt-12"
            >
              password
            </label>
            <input
              type="text"
              className="appearance-none border-b-2 border-boulder-brown 
               bg-boulder-beige text-boulder-brown w-full mb-12"
            />
            <button className="bg-boulder-blue after:content-['\ '] after:w-full after:bg-boulder-blue after:absolute after:top-3 text-boulder-brown border-boulder-brown text-xl pl-4 border-2 text-start p-1">
              login
            </button>
            <button className="bg-boulder-orange  text-boulder-brown border-boulder-brown text-xl pl-4 border-2 text-start p-1">
              recover account
            </button>
          </form>
        </div>
      </div>
    </DefaultLayout>
  );
}

export default Login;
