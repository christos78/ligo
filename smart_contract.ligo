type votesMap is map(address, bool)

type storageType is record [
  votes: votesMap;
  paused: bool;
  admin: address;
]

type actionPause is record [
  status : bool;
]
type actionSetAdmin is record [
  user: address;
]

function is_admin(const user: address; const store: storageType): bool is
    block { skip } with (user = store.admin)

function is_paused(const store: storageType): bool is
    block { skip } with (store.paused)

function set_admin(const user: address; const store: storageType): (list(operation) * storageType) is
  begin
    const checkAdmin: bool = is_admin(sender, store);
    case checkAdmin of
      | True -> store.admin := user
      | False -> failwith("need admin privileges")
    end
  with ((nil: list(operation) , store)

function pause(const requestStatus: bool; const store: storageType): (list(operation) * storageType) is
  begin
    const check: bool = is_admin(sender, store);
    case check of
    | True -> store.paused := requestStatus
    | False -> failwith("need admin privileges")
    end

function vote(const vote: bool; const store: storageType): (list(operation) * storageType) is
  begin
    const check: bool = !is_admin()
  end
  
function main(const action : actionVote; const store: storageType) : (list(operation) * storageType) is
  block {skip} with
    case action of
    | Pause (p) -> pause(p.status, store)
    | SetAdmin (a) -> set_admin(a.user, store)
    | Vote (v) -> vote (votes.bool, store)
  end